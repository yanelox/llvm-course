; ModuleID = 'source/game.c'
source_filename = "source/game.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Color = type { i32, i32, i32, i32 }
%struct.CellField = type { [360000 x i32] }

@__const.drawCellField.cellColor = private unnamed_addr constant %struct.Color { i32 0, i32 255, i32 0, i32 255 }, align 4
@__const.gameCycle.title = private unnamed_addr constant [10 x i8] c"LIFE GAME\00", align 1
@__const.gameCycle.black_color = private unnamed_addr constant %struct.Color { i32 0, i32 0, i32 0, i32 255 }, align 4

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @copyCellField(%struct.CellField* noundef %0, %struct.CellField* noundef %1) #0 {
  %3 = alloca %struct.CellField*, align 8
  %4 = alloca %struct.CellField*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.CellField* %0, %struct.CellField** %3, align 8
  store %struct.CellField* %1, %struct.CellField** %4, align 8
  store i32 0, i32* %5, align 4
  br label %7

7:                                                ; preds = %36, %2
  %8 = load i32, i32* %5, align 4
  %9 = icmp slt i32 %8, 600
  br i1 %9, label %10, label %39

10:                                               ; preds = %7
  store i32 0, i32* %6, align 4
  br label %11

11:                                               ; preds = %32, %10
  %12 = load i32, i32* %6, align 4
  %13 = icmp slt i32 %12, 600
  br i1 %13, label %14, label %35

14:                                               ; preds = %11
  %15 = load %struct.CellField*, %struct.CellField** %3, align 8
  %16 = getelementptr inbounds %struct.CellField, %struct.CellField* %15, i32 0, i32 0
  %17 = load i32, i32* %5, align 4
  %18 = mul nsw i32 %17, 600
  %19 = load i32, i32* %6, align 4
  %20 = add nsw i32 %18, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [360000 x i32], [360000 x i32]* %16, i64 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = load %struct.CellField*, %struct.CellField** %4, align 8
  %25 = getelementptr inbounds %struct.CellField, %struct.CellField* %24, i32 0, i32 0
  %26 = load i32, i32* %5, align 4
  %27 = mul nsw i32 %26, 600
  %28 = load i32, i32* %6, align 4
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [360000 x i32], [360000 x i32]* %25, i64 0, i64 %30
  store i32 %23, i32* %31, align 4
  br label %32

32:                                               ; preds = %14
  %33 = load i32, i32* %6, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %6, align 4
  br label %11, !llvm.loop !6

35:                                               ; preds = %11
  br label %36

36:                                               ; preds = %35
  %37 = load i32, i32* %5, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %5, align 4
  br label %7, !llvm.loop !8

39:                                               ; preds = %7
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @updateCellField(%struct.CellField* noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.CellField*, align 8
  %4 = alloca %struct.CellField, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store %struct.CellField* %0, %struct.CellField** %3, align 8
  %13 = load %struct.CellField*, %struct.CellField** %3, align 8
  call void @copyCellField(%struct.CellField* noundef %13, %struct.CellField* noundef %4)
  store i32 0, i32* %5, align 4
  store i32 0, i32* %6, align 4
  br label %14

14:                                               ; preds = %134, %1
  %15 = load i32, i32* %6, align 4
  %16 = icmp slt i32 %15, 600
  br i1 %16, label %17, label %137

17:                                               ; preds = %14
  store i32 0, i32* %7, align 4
  br label %18

18:                                               ; preds = %130, %17
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %19, 600
  br i1 %20, label %21, label %133

21:                                               ; preds = %18
  store i32 0, i32* %8, align 4
  store i32 -1, i32* %9, align 4
  br label %22

22:                                               ; preds = %75, %21
  %23 = load i32, i32* %9, align 4
  %24 = icmp sle i32 %23, 1
  br i1 %24, label %25, label %78

25:                                               ; preds = %22
  store i32 -1, i32* %10, align 4
  br label %26

26:                                               ; preds = %71, %25
  %27 = load i32, i32* %10, align 4
  %28 = icmp sle i32 %27, 1
  br i1 %28, label %29, label %74

29:                                               ; preds = %26
  %30 = load i32, i32* %9, align 4
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %36

32:                                               ; preds = %29
  %33 = load i32, i32* %10, align 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %36

35:                                               ; preds = %32
  br label %71

36:                                               ; preds = %32, %29
  %37 = load i32, i32* %6, align 4
  %38 = load i32, i32* %9, align 4
  %39 = add nsw i32 %37, %38
  %40 = srem i32 %39, 600
  store i32 %40, i32* %11, align 4
  %41 = load i32, i32* %11, align 4
  %42 = icmp slt i32 %41, 0
  br i1 %42, label %43, label %46

43:                                               ; preds = %36
  %44 = load i32, i32* %11, align 4
  %45 = add nsw i32 %44, 600
  store i32 %45, i32* %11, align 4
  br label %46

46:                                               ; preds = %43, %36
  %47 = load i32, i32* %7, align 4
  %48 = load i32, i32* %10, align 4
  %49 = add nsw i32 %47, %48
  %50 = srem i32 %49, 600
  store i32 %50, i32* %12, align 4
  %51 = load i32, i32* %12, align 4
  %52 = icmp slt i32 %51, 0
  br i1 %52, label %53, label %56

53:                                               ; preds = %46
  %54 = load i32, i32* %12, align 4
  %55 = add nsw i32 %54, 600
  store i32 %55, i32* %12, align 4
  br label %56

56:                                               ; preds = %53, %46
  %57 = load %struct.CellField*, %struct.CellField** %3, align 8
  %58 = getelementptr inbounds %struct.CellField, %struct.CellField* %57, i32 0, i32 0
  %59 = load i32, i32* %11, align 4
  %60 = mul nsw i32 %59, 600
  %61 = load i32, i32* %12, align 4
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [360000 x i32], [360000 x i32]* %58, i64 0, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = icmp eq i32 %65, 1
  br i1 %66, label %67, label %70

67:                                               ; preds = %56
  %68 = load i32, i32* %8, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %8, align 4
  br label %70

70:                                               ; preds = %67, %56
  br label %71

71:                                               ; preds = %70, %35
  %72 = load i32, i32* %10, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %10, align 4
  br label %26, !llvm.loop !9

74:                                               ; preds = %26
  br label %75

75:                                               ; preds = %74
  %76 = load i32, i32* %9, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %9, align 4
  br label %22, !llvm.loop !10

78:                                               ; preds = %22
  %79 = load %struct.CellField*, %struct.CellField** %3, align 8
  %80 = getelementptr inbounds %struct.CellField, %struct.CellField* %79, i32 0, i32 0
  %81 = load i32, i32* %6, align 4
  %82 = mul nsw i32 %81, 600
  %83 = load i32, i32* %7, align 4
  %84 = add nsw i32 %82, %83
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [360000 x i32], [360000 x i32]* %80, i64 0, i64 %85
  %87 = load i32, i32* %86, align 4
  %88 = icmp eq i32 %87, 1
  br i1 %88, label %89, label %103

89:                                               ; preds = %78
  %90 = load i32, i32* %8, align 4
  %91 = icmp slt i32 %90, 2
  br i1 %91, label %95, label %92

92:                                               ; preds = %89
  %93 = load i32, i32* %8, align 4
  %94 = icmp sgt i32 %93, 3
  br i1 %94, label %95, label %103

95:                                               ; preds = %92, %89
  %96 = getelementptr inbounds %struct.CellField, %struct.CellField* %4, i32 0, i32 0
  %97 = load i32, i32* %6, align 4
  %98 = mul nsw i32 %97, 600
  %99 = load i32, i32* %7, align 4
  %100 = add nsw i32 %98, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [360000 x i32], [360000 x i32]* %96, i64 0, i64 %101
  store i32 0, i32* %102, align 4
  br label %129

103:                                              ; preds = %92, %78
  %104 = load %struct.CellField*, %struct.CellField** %3, align 8
  %105 = getelementptr inbounds %struct.CellField, %struct.CellField* %104, i32 0, i32 0
  %106 = load i32, i32* %6, align 4
  %107 = mul nsw i32 %106, 600
  %108 = load i32, i32* %7, align 4
  %109 = add nsw i32 %107, %108
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [360000 x i32], [360000 x i32]* %105, i64 0, i64 %110
  %112 = load i32, i32* %111, align 4
  %113 = icmp eq i32 %112, 0
  br i1 %113, label %114, label %125

114:                                              ; preds = %103
  %115 = load i32, i32* %8, align 4
  %116 = icmp eq i32 %115, 3
  br i1 %116, label %117, label %125

117:                                              ; preds = %114
  %118 = getelementptr inbounds %struct.CellField, %struct.CellField* %4, i32 0, i32 0
  %119 = load i32, i32* %6, align 4
  %120 = mul nsw i32 %119, 600
  %121 = load i32, i32* %7, align 4
  %122 = add nsw i32 %120, %121
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [360000 x i32], [360000 x i32]* %118, i64 0, i64 %123
  store i32 1, i32* %124, align 4
  br label %128

125:                                              ; preds = %114, %103
  %126 = load i32, i32* %5, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %5, align 4
  br label %128

128:                                              ; preds = %125, %117
  br label %129

129:                                              ; preds = %128, %95
  br label %130

130:                                              ; preds = %129
  %131 = load i32, i32* %7, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %7, align 4
  br label %18, !llvm.loop !11

133:                                              ; preds = %18
  br label %134

134:                                              ; preds = %133
  %135 = load i32, i32* %6, align 4
  %136 = add nsw i32 %135, 1
  store i32 %136, i32* %6, align 4
  br label %14, !llvm.loop !12

137:                                              ; preds = %14
  %138 = load i32, i32* %5, align 4
  %139 = icmp eq i32 %138, 360000
  br i1 %139, label %140, label %141

140:                                              ; preds = %137
  store i32 0, i32* %2, align 4
  br label %144

141:                                              ; preds = %137
  %142 = load %struct.CellField*, %struct.CellField** %3, align 8
  call void @copyCellField(%struct.CellField* noundef %4, %struct.CellField* noundef %142)
  br label %143

143:                                              ; preds = %141
  store i32 1, i32* %2, align 4
  br label %144

144:                                              ; preds = %143, %140
  %145 = load i32, i32* %2, align 4
  ret i32 %145
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @drawCellField(%struct.CellField* noundef %0) #0 {
  %2 = alloca %struct.CellField*, align 8
  %3 = alloca %struct.Color, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store %struct.CellField* %0, %struct.CellField** %2, align 8
  %6 = bitcast %struct.Color* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %6, i8* align 4 bitcast (%struct.Color* @__const.drawCellField.cellColor to i8*), i64 16, i1 false)
  store i32 0, i32* %4, align 4
  br label %7

7:                                                ; preds = %38, %1
  %8 = load i32, i32* %4, align 4
  %9 = icmp slt i32 %8, 600
  br i1 %9, label %10, label %41

10:                                               ; preds = %7
  store i32 0, i32* %5, align 4
  br label %11

11:                                               ; preds = %34, %10
  %12 = load i32, i32* %5, align 4
  %13 = icmp slt i32 %12, 600
  br i1 %13, label %14, label %37

14:                                               ; preds = %11
  %15 = load %struct.CellField*, %struct.CellField** %2, align 8
  %16 = getelementptr inbounds %struct.CellField, %struct.CellField* %15, i32 0, i32 0
  %17 = load i32, i32* %4, align 4
  %18 = mul nsw i32 %17, 600
  %19 = load i32, i32* %5, align 4
  %20 = add nsw i32 %18, %19
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [360000 x i32], [360000 x i32]* %16, i64 0, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = icmp eq i32 %23, 1
  br i1 %24, label %25, label %33

25:                                               ; preds = %14
  %26 = load i32, i32* %4, align 4
  %27 = load i32, i32* %5, align 4
  %28 = bitcast %struct.Color* %3 to { i64, i64 }*
  %29 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %28, i32 0, i32 0
  %30 = load i64, i64* %29, align 4
  %31 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %28, i32 0, i32 1
  %32 = load i64, i64* %31, align 4
  call void @addPixel(i32 noundef %26, i32 noundef %27, i64 %30, i64 %32)
  br label %33

33:                                               ; preds = %25, %14
  br label %34

34:                                               ; preds = %33
  %35 = load i32, i32* %5, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %5, align 4
  br label %11, !llvm.loop !13

37:                                               ; preds = %11
  br label %38

38:                                               ; preds = %37
  %39 = load i32, i32* %4, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %4, align 4
  br label %7, !llvm.loop !14

41:                                               ; preds = %7
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

declare void @addPixel(i32 noundef, i32 noundef, i64, i64) #2

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @gameCycle() #0 {
  %1 = alloca [10 x i8], align 1
  %2 = alloca %struct.CellField, align 4
  %3 = alloca %struct.Color, align 4
  %4 = bitcast [10 x i8]* %1 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 1 %4, i8* align 1 getelementptr inbounds ([10 x i8], [10 x i8]* @__const.gameCycle.title, i32 0, i32 0), i64 10, i1 false)
  %5 = getelementptr inbounds [10 x i8], [10 x i8]* %1, i64 0, i64 0
  call void @createWindow(i32 noundef 600, i32 noundef 600, i8* noundef %5)
  call void @randomFillCellField(%struct.CellField* noundef %2)
  br label %6

6:                                                ; preds = %19, %0
  %7 = call i32 (...) @isOpenWindow()
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %20

9:                                                ; preds = %6
  %10 = bitcast %struct.Color* %3 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %10, i8* align 4 bitcast (%struct.Color* @__const.gameCycle.black_color to i8*), i64 16, i1 false)
  %11 = bitcast %struct.Color* %3 to { i64, i64 }*
  %12 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %11, i32 0, i32 0
  %13 = load i64, i64* %12, align 4
  %14 = getelementptr inbounds { i64, i64 }, { i64, i64 }* %11, i32 0, i32 1
  %15 = load i64, i64* %14, align 4
  call void @colorWindow(i64 %13, i64 %15)
  %16 = call i32 @updateCellField(%struct.CellField* noundef %2)
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %19

18:                                               ; preds = %9
  br label %20

19:                                               ; preds = %9
  call void @drawCellField(%struct.CellField* noundef %2)
  call void (...) @displayWindow()
  br label %6, !llvm.loop !15

20:                                               ; preds = %18, %6
  call void (...) @destroyWindow()
  ret void
}

declare void @createWindow(i32 noundef, i32 noundef, i8* noundef) #2

declare void @randomFillCellField(%struct.CellField* noundef) #2

declare i32 @isOpenWindow(...) #2

declare void @colorWindow(i64, i64) #2

declare void @displayWindow(...) #2

declare void @destroyWindow(...) #2

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

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
!15 = distinct !{!15, !7}
