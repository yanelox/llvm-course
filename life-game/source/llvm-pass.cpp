#include "llvm/Pass.h"
#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/IR/IRBuilder.h"
using namespace llvm;

#include <string>

bool isFuncLogger(StringRef name) {
        return name == "Logger" || name == "Dump";
    }

namespace {
    struct MyPass : public FunctionPass {
        static char ID;
        MyPass() : FunctionPass(ID) {}

        virtual bool runOnFunction(Function &F) {
            if(isFuncLogger(F.getName()) || F.getName().contains("randomFillCellField"))
                return false;

            LLVMContext &Ctx = F.getContext();
            IRBuilder<> builder(Ctx);
            Type *retType = Type::getVoidTy(Ctx);

            ArrayRef<Type *> LoggerParamTypes = {builder.getInt8Ty()->getPointerTo(), builder.getInt64Ty()};
            FunctionType *LoggerFuncType = FunctionType::get(retType, LoggerParamTypes, false);
            FunctionCallee LoggerFunc = F.getParent()->getOrInsertFunction("Logger", LoggerFuncType);

            ArrayRef<Type *> DumpParamTypes = {};
            FunctionType *DumpFuncType = FunctionType::get(retType, DumpParamTypes, false);
            FunctionCallee DumpFunc = F.getParent()->getOrInsertFunction("Dump", DumpFuncType);

            for (auto &B : F) {
                for (auto &I : B) {
                    if (strcmp(I.getOpcodeName(), "phi") == 0)
                        continue;

                    if (auto *call = dyn_cast<CallInst>(&I))
                        if (call->getCalledFunction() && isFuncLogger(call->getCalledFunction()->getName()))
                            continue;

                    // std::string stream;
                    // raw_string_ostream instr_stream{stream};
                    // I.print(instr_stream, true);

                    builder.SetInsertPoint(&I);
                    // Value *funcName = builder.CreateGlobalStringPtr(F.getName());
                    // Value *instr = builder.CreateGlobalStringPtr(instr_stream.str());
                    Value* instrName = builder.CreateGlobalStringPtr(I.getOpcodeName());
                    Value *instrOpcode = ConstantInt::get(builder.getInt64Ty(), (int64_t)(I.getOpcode()));
                    Value *args[] = {instrName, instrOpcode};
                    builder.CreateCall(LoggerFunc, args);

                    if (auto *ret = dyn_cast<ReturnInst>(&I))
                        if (F.getName() == "main")
                            builder.CreateCall(DumpFunc, None);
                }
            }

            return true;
        }
    };
}

char MyPass::ID = 0;

static void registerMyPass(const PassManagerBuilder &,
                                                 legacy::PassManagerBase &PM) {
    PM.add(new MyPass());
}
static RegisterStandardPasses
    RegisterMyPass(PassManagerBuilder::EP_OptimizerLast,
                                 registerMyPass);
