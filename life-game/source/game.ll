; ModuleID = 'source/game.c'
source_filename = "source/game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.sfColor = type { i8, i8, i8, i8 }
%struct.CellField = type { i64, i32* }
%struct.Window = type { i64, %struct.sfRenderWindow* }
%struct.sfRenderWindow = type opaque

@sfGreen = external global %struct.sfColor, align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local %struct.CellField* @createCellField(i64 noundef %0) #0 {
  %2 = alloca %struct.CellField*, align 8
  %3 = alloca i64, align 8
  %4 = alloca %struct.CellField*, align 8
  store i64 %0, i64* %3, align 8
  %5 = call noalias i8* @calloc(i64 noundef 1, i64 noundef 16) #4
  %6 = bitcast i8* %5 to %struct.CellField*
  store %struct.CellField* %6, %struct.CellField** %4, align 8
  %7 = load %struct.CellField*, %struct.CellField** %4, align 8
  %8 = icmp eq %struct.CellField* %7, null
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store %struct.CellField* null, %struct.CellField** %2, align 8
  br label %30

10:                                               ; preds = %1
  %11 = load i64, i64* %3, align 8
  %12 = load %struct.CellField*, %struct.CellField** %4, align 8
  %13 = getelementptr inbounds %struct.CellField, %struct.CellField* %12, i32 0, i32 0
  store i64 %11, i64* %13, align 8
  %14 = load i64, i64* %3, align 8
  %15 = load i64, i64* %3, align 8
  %16 = mul i64 %14, %15
  %17 = call noalias i8* @calloc(i64 noundef %16, i64 noundef 4) #4
  %18 = bitcast i8* %17 to i32*
  %19 = load %struct.CellField*, %struct.CellField** %4, align 8
  %20 = getelementptr inbounds %struct.CellField, %struct.CellField* %19, i32 0, i32 1
  store i32* %18, i32** %20, align 8
  %21 = load %struct.CellField*, %struct.CellField** %4, align 8
  %22 = getelementptr inbounds %struct.CellField, %struct.CellField* %21, i32 0, i32 1
  %23 = load i32*, i32** %22, align 8
  %24 = icmp eq i32* %23, null
  br i1 %24, label %25, label %28

25:                                               ; preds = %10
  %26 = load %struct.CellField*, %struct.CellField** %4, align 8
  %27 = bitcast %struct.CellField* %26 to i8*
  call void @free(i8* noundef %27) #4
  store %struct.CellField* null, %struct.CellField** %2, align 8
  br label %30

28:                                               ; preds = %10
  %29 = load %struct.CellField*, %struct.CellField** %4, align 8
  store %struct.CellField* %29, %struct.CellField** %2, align 8
  br label %30

30:                                               ; preds = %28, %25, %9
  %31 = load %struct.CellField*, %struct.CellField** %2, align 8
  ret %struct.CellField* %31
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64 noundef, i64 noundef) #1

; Function Attrs: nounwind
declare void @free(i8* noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @destroyCellField(%struct.CellField* noundef %0) #0 {
  %2 = alloca %struct.CellField*, align 8
  store %struct.CellField* %0, %struct.CellField** %2, align 8
  %3 = load %struct.CellField*, %struct.CellField** %2, align 8
  %4 = getelementptr inbounds %struct.CellField, %struct.CellField* %3, i32 0, i32 1
  %5 = load i32*, i32** %4, align 8
  %6 = bitcast i32* %5 to i8*
  call void @free(i8* noundef %6) #4
  %7 = load %struct.CellField*, %struct.CellField** %2, align 8
  %8 = bitcast %struct.CellField* %7 to i8*
  call void @free(i8* noundef %8) #4
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @randomFillCellField(%struct.CellField* noundef %0) #0 {
  %2 = alloca %struct.CellField*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store %struct.CellField* %0, %struct.CellField** %2, align 8
  store i32 0, i32* %3, align 4
  br label %5

5:                                                ; preds = %42, %1
  %6 = load i32, i32* %3, align 4
  %7 = sext i32 %6 to i64
  %8 = load %struct.CellField*, %struct.CellField** %2, align 8
  %9 = getelementptr inbounds %struct.CellField, %struct.CellField* %8, i32 0, i32 0
  %10 = load i64, i64* %9, align 8
  %11 = icmp ult i64 %7, %10
  br i1 %11, label %12, label %45

12:                                               ; preds = %5
  store i32 0, i32* %4, align 4
  br label %13

13:                                               ; preds = %38, %12
  %14 = load i32, i32* %4, align 4
  %15 = sext i32 %14 to i64
  %16 = load %struct.CellField*, %struct.CellField** %2, align 8
  %17 = getelementptr inbounds %struct.CellField, %struct.CellField* %16, i32 0, i32 0
  %18 = load i64, i64* %17, align 8
  %19 = icmp ult i64 %15, %18
  br i1 %19, label %20, label %41

20:                                               ; preds = %13
  %21 = call i32 @rand() #4
  %22 = icmp sgt i32 %21, 143165576
  %23 = zext i1 %22 to i64
  %24 = select i1 %22, i32 0, i32 1
  %25 = load %struct.CellField*, %struct.CellField** %2, align 8
  %26 = getelementptr inbounds %struct.CellField, %struct.CellField* %25, i32 0, i32 1
  %27 = load i32*, i32** %26, align 8
  %28 = load i32, i32* %3, align 4
  %29 = sext i32 %28 to i64
  %30 = load %struct.CellField*, %struct.CellField** %2, align 8
  %31 = getelementptr inbounds %struct.CellField, %struct.CellField* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = mul i64 %29, %32
  %34 = load i32, i32* %4, align 4
  %35 = sext i32 %34 to i64
  %36 = add i64 %33, %35
  %37 = getelementptr inbounds i32, i32* %27, i64 %36
  store i32 %24, i32* %37, align 4
  br label %38

38:                                               ; preds = %20
  %39 = load i32, i32* %4, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %4, align 4
  br label %13, !llvm.loop !6

41:                                               ; preds = %13
  br label %42

42:                                               ; preds = %41
  %43 = load i32, i32* %3, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %3, align 4
  br label %5, !llvm.loop !8

45:                                               ; preds = %5
  ret void
}

; Function Attrs: nounwind
declare i32 @rand() #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @updateCellField(%struct.CellField* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.CellField*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store %struct.CellField* %0, %struct.CellField** %3, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %5, align 4
  br label %12

12:                                               ; preds = %165, %1
  %13 = load i32, i32* %5, align 4
  %14 = sext i32 %13 to i64
  %15 = load %struct.CellField*, %struct.CellField** %3, align 8
  %16 = getelementptr inbounds %struct.CellField, %struct.CellField* %15, i32 0, i32 0
  %17 = load i64, i64* %16, align 8
  %18 = icmp ult i64 %14, %17
  br i1 %18, label %19, label %168

19:                                               ; preds = %12
  store i32 0, i32* %6, align 4
  br label %20

20:                                               ; preds = %161, %19
  %21 = load i32, i32* %6, align 4
  %22 = sext i32 %21 to i64
  %23 = load %struct.CellField*, %struct.CellField** %3, align 8
  %24 = getelementptr inbounds %struct.CellField, %struct.CellField* %23, i32 0, i32 0
  %25 = load i64, i64* %24, align 8
  %26 = icmp ult i64 %22, %25
  br i1 %26, label %27, label %164

27:                                               ; preds = %20
  store i32 0, i32* %7, align 4
  store i32 -1, i32* %8, align 4
  br label %28

28:                                               ; preds = %84, %27
  %29 = load i32, i32* %8, align 4
  %30 = icmp sle i32 %29, 1
  br i1 %30, label %31, label %87

31:                                               ; preds = %28
  store i32 -1, i32* %9, align 4
  br label %32

32:                                               ; preds = %80, %31
  %33 = load i32, i32* %9, align 4
  %34 = icmp sle i32 %33, 1
  br i1 %34, label %35, label %83

35:                                               ; preds = %32
  %36 = load i32, i32* %8, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %42

38:                                               ; preds = %35
  %39 = load i32, i32* %9, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %42

41:                                               ; preds = %38
  br label %80

42:                                               ; preds = %38, %35
  %43 = load i32, i32* %5, align 4
  %44 = load i32, i32* %8, align 4
  %45 = add nsw i32 %43, %44
  %46 = sext i32 %45 to i64
  %47 = load %struct.CellField*, %struct.CellField** %3, align 8
  %48 = getelementptr inbounds %struct.CellField, %struct.CellField* %47, i32 0, i32 0
  %49 = load i64, i64* %48, align 8
  %50 = urem i64 %46, %49
  %51 = trunc i64 %50 to i32
  store i32 %51, i32* %10, align 4
  %52 = load i32, i32* %6, align 4
  %53 = load i32, i32* %9, align 4
  %54 = add nsw i32 %52, %53
  %55 = sext i32 %54 to i64
  %56 = load %struct.CellField*, %struct.CellField** %3, align 8
  %57 = getelementptr inbounds %struct.CellField, %struct.CellField* %56, i32 0, i32 0
  %58 = load i64, i64* %57, align 8
  %59 = urem i64 %55, %58
  %60 = trunc i64 %59 to i32
  store i32 %60, i32* %11, align 4
  %61 = load %struct.CellField*, %struct.CellField** %3, align 8
  %62 = getelementptr inbounds %struct.CellField, %struct.CellField* %61, i32 0, i32 1
  %63 = load i32*, i32** %62, align 8
  %64 = load i32, i32* %10, align 4
  %65 = sext i32 %64 to i64
  %66 = load %struct.CellField*, %struct.CellField** %3, align 8
  %67 = getelementptr inbounds %struct.CellField, %struct.CellField* %66, i32 0, i32 0
  %68 = load i64, i64* %67, align 8
  %69 = mul i64 %65, %68
  %70 = load i32, i32* %11, align 4
  %71 = sext i32 %70 to i64
  %72 = add i64 %69, %71
  %73 = getelementptr inbounds i32, i32* %63, i64 %72
  %74 = load i32, i32* %73, align 4
  %75 = icmp eq i32 %74, 1
  br i1 %75, label %76, label %79

76:                                               ; preds = %42
  %77 = load i32, i32* %7, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %7, align 4
  br label %79

79:                                               ; preds = %76, %42
  br label %80

80:                                               ; preds = %79, %41
  %81 = load i32, i32* %9, align 4
  %82 = add nsw i32 %81, 1
  store i32 %82, i32* %9, align 4
  br label %32, !llvm.loop !9

83:                                               ; preds = %32
  br label %84

84:                                               ; preds = %83
  %85 = load i32, i32* %8, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %8, align 4
  br label %28, !llvm.loop !10

87:                                               ; preds = %28
  %88 = load %struct.CellField*, %struct.CellField** %3, align 8
  %89 = getelementptr inbounds %struct.CellField, %struct.CellField* %88, i32 0, i32 1
  %90 = load i32*, i32** %89, align 8
  %91 = load i32, i32* %5, align 4
  %92 = sext i32 %91 to i64
  %93 = load %struct.CellField*, %struct.CellField** %3, align 8
  %94 = getelementptr inbounds %struct.CellField, %struct.CellField* %93, i32 0, i32 0
  %95 = load i64, i64* %94, align 8
  %96 = mul i64 %92, %95
  %97 = load i32, i32* %6, align 4
  %98 = sext i32 %97 to i64
  %99 = add i64 %96, %98
  %100 = getelementptr inbounds i32, i32* %90, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = icmp eq i32 %101, 1
  br i1 %102, label %103, label %123

103:                                              ; preds = %87
  %104 = load i32, i32* %7, align 4
  %105 = icmp slt i32 %104, 2
  br i1 %105, label %109, label %106

106:                                              ; preds = %103
  %107 = load i32, i32* %7, align 4
  %108 = icmp sgt i32 %107, 3
  br i1 %108, label %109, label %123

109:                                              ; preds = %106, %103
  %110 = load %struct.CellField*, %struct.CellField** %3, align 8
  %111 = getelementptr inbounds %struct.CellField, %struct.CellField* %110, i32 0, i32 1
  %112 = load i32*, i32** %111, align 8
  %113 = load i32, i32* %5, align 4
  %114 = sext i32 %113 to i64
  %115 = load %struct.CellField*, %struct.CellField** %3, align 8
  %116 = getelementptr inbounds %struct.CellField, %struct.CellField* %115, i32 0, i32 0
  %117 = load i64, i64* %116, align 8
  %118 = mul i64 %114, %117
  %119 = load i32, i32* %6, align 4
  %120 = sext i32 %119 to i64
  %121 = add i64 %118, %120
  %122 = getelementptr inbounds i32, i32* %112, i64 %121
  store i32 0, i32* %122, align 4
  br label %160

123:                                              ; preds = %106, %87
  %124 = load %struct.CellField*, %struct.CellField** %3, align 8
  %125 = getelementptr inbounds %struct.CellField, %struct.CellField* %124, i32 0, i32 1
  %126 = load i32*, i32** %125, align 8
  %127 = load i32, i32* %5, align 4
  %128 = sext i32 %127 to i64
  %129 = load %struct.CellField*, %struct.CellField** %3, align 8
  %130 = getelementptr inbounds %struct.CellField, %struct.CellField* %129, i32 0, i32 0
  %131 = load i64, i64* %130, align 8
  %132 = mul i64 %128, %131
  %133 = load i32, i32* %6, align 4
  %134 = sext i32 %133 to i64
  %135 = add i64 %132, %134
  %136 = getelementptr inbounds i32, i32* %126, i64 %135
  %137 = load i32, i32* %136, align 4
  %138 = icmp eq i32 %137, 0
  br i1 %138, label %139, label %156

139:                                              ; preds = %123
  %140 = load i32, i32* %7, align 4
  %141 = icmp eq i32 %140, 3
  br i1 %141, label %142, label %156

142:                                              ; preds = %139
  %143 = load %struct.CellField*, %struct.CellField** %3, align 8
  %144 = getelementptr inbounds %struct.CellField, %struct.CellField* %143, i32 0, i32 1
  %145 = load i32*, i32** %144, align 8
  %146 = load i32, i32* %5, align 4
  %147 = sext i32 %146 to i64
  %148 = load %struct.CellField*, %struct.CellField** %3, align 8
  %149 = getelementptr inbounds %struct.CellField, %struct.CellField* %148, i32 0, i32 0
  %150 = load i64, i64* %149, align 8
  %151 = mul i64 %147, %150
  %152 = load i32, i32* %6, align 4
  %153 = sext i32 %152 to i64
  %154 = add i64 %151, %153
  %155 = getelementptr inbounds i32, i32* %145, i64 %154
  store i32 1, i32* %155, align 4
  br label %159

156:                                              ; preds = %139, %123
  %157 = load i32, i32* %4, align 4
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %4, align 4
  br label %159

159:                                              ; preds = %156, %142
  br label %160

160:                                              ; preds = %159, %109
  br label %161

161:                                              ; preds = %160
  %162 = load i32, i32* %6, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %6, align 4
  br label %20, !llvm.loop !11

164:                                              ; preds = %20
  br label %165

165:                                              ; preds = %164
  %166 = load i32, i32* %5, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %5, align 4
  br label %12, !llvm.loop !12

168:                                              ; preds = %12
  %169 = load i32, i32* %4, align 4
  %170 = sext i32 %169 to i64
  %171 = load %struct.CellField*, %struct.CellField** %3, align 8
  %172 = getelementptr inbounds %struct.CellField, %struct.CellField* %171, i32 0, i32 0
  %173 = load i64, i64* %172, align 8
  %174 = load %struct.CellField*, %struct.CellField** %3, align 8
  %175 = getelementptr inbounds %struct.CellField, %struct.CellField* %174, i32 0, i32 0
  %176 = load i64, i64* %175, align 8
  %177 = mul i64 %173, %176
  %178 = icmp eq i64 %170, %177
  br i1 %178, label %179, label %180

179:                                              ; preds = %168
  store i32 0, i32* %2, align 4
  br label %181

180:                                              ; preds = %168
  store i32 1, i32* %2, align 4
  br label %181

181:                                              ; preds = %180, %179
  %182 = load i32, i32* %2, align 4
  ret i32 %182
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawCellField(%struct.Window* noundef %0, %struct.CellField* noundef %1) #0 {
  %3 = alloca %struct.Window*, align 8
  %4 = alloca %struct.CellField*, align 8
  %5 = alloca %struct.sfColor, align 1
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.Window* %0, %struct.Window** %3, align 8
  store %struct.CellField* %1, %struct.CellField** %4, align 8
  %8 = bitcast %struct.sfColor* %5 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %8, i8* align 1 getelementptr inbounds (%struct.sfColor, %struct.sfColor* @sfGreen, i32 0, i32 0), i64 4, i1 false)
  store i32 0, i32* %6, align 4
  br label %9

9:                                                ; preds = %51, %2
  %10 = load i32, i32* %6, align 4
  %11 = sext i32 %10 to i64
  %12 = load %struct.CellField*, %struct.CellField** %4, align 8
  %13 = getelementptr inbounds %struct.CellField, %struct.CellField* %12, i32 0, i32 0
  %14 = load i64, i64* %13, align 8
  %15 = icmp ult i64 %11, %14
  br i1 %15, label %16, label %54

16:                                               ; preds = %9
  store i32 0, i32* %7, align 4
  br label %17

17:                                               ; preds = %47, %16
  %18 = load i32, i32* %7, align 4
  %19 = sext i32 %18 to i64
  %20 = load %struct.CellField*, %struct.CellField** %4, align 8
  %21 = getelementptr inbounds %struct.CellField, %struct.CellField* %20, i32 0, i32 0
  %22 = load i64, i64* %21, align 8
  %23 = icmp ult i64 %19, %22
  br i1 %23, label %24, label %50

24:                                               ; preds = %17
  %25 = load %struct.CellField*, %struct.CellField** %4, align 8
  %26 = getelementptr inbounds %struct.CellField, %struct.CellField* %25, i32 0, i32 1
  %27 = load i32*, i32** %26, align 8
  %28 = load i32, i32* %6, align 4
  %29 = sext i32 %28 to i64
  %30 = load %struct.CellField*, %struct.CellField** %4, align 8
  %31 = getelementptr inbounds %struct.CellField, %struct.CellField* %30, i32 0, i32 0
  %32 = load i64, i64* %31, align 8
  %33 = mul i64 %29, %32
  %34 = load i32, i32* %7, align 4
  %35 = sext i32 %34 to i64
  %36 = add i64 %33, %35
  %37 = getelementptr inbounds i32, i32* %27, i64 %36
  %38 = load i32, i32* %37, align 4
  %39 = icmp eq i32 %38, 1
  br i1 %39, label %40, label %46

40:                                               ; preds = %24
  %41 = load %struct.Window*, %struct.Window** %3, align 8
  %42 = load i32, i32* %6, align 4
  %43 = load i32, i32* %7, align 4
  %44 = bitcast %struct.sfColor* %5 to i32*
  %45 = load i32, i32* %44, align 1
  call void @addPixel(%struct.Window* noundef %41, i32 noundef %42, i32 noundef %43, i32 %45)
  br label %46

46:                                               ; preds = %40, %24
  br label %47

47:                                               ; preds = %46
  %48 = load i32, i32* %7, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %7, align 4
  br label %17, !llvm.loop !13

50:                                               ; preds = %17
  br label %51

51:                                               ; preds = %50
  %52 = load i32, i32* %6, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %6, align 4
  br label %9, !llvm.loop !14

54:                                               ; preds = %9
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #2

declare void @addPixel(%struct.Window* noundef, i32 noundef, i32 noundef, i32) #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { argmemonly nofree nounwind willreturn }
attributes #3 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-1ubuntu1.1"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
