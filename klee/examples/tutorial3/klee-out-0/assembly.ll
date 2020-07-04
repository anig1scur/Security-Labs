; ModuleID = 'maze.bc'
source_filename = "maze.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@maze = dso_local global [7 x [11 x i8]] [[11 x i8] c"+-+---+---+", [11 x i8] c"| |     |#|", [11 x i8] c"| | --+ | |", [11 x i8] c"| |   | | |", [11 x i8] c"| +-- | | |", [11 x i8] c"|     |   |", [11 x i8] c"+-----+---+"], align 16, !dbg !0
@.str = private unnamed_addr constant [3 x i8] c"%c\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.2 = private unnamed_addr constant [24 x i8] c"Maze dimensions: %dx%d\0A\00", align 1
@.str.3 = private unnamed_addr constant [19 x i8] c"Player pos: %dx%d\0A\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"Iteration no. %d\0A\00", align 1
@.str.5 = private unnamed_addr constant [67 x i8] c"Program the player moves with a sequence of 'w', 's', 'a' and 'd'\0A\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"Try to reach the price(#)!\0A\00", align 1
@.str.7 = private unnamed_addr constant [8 x i8] c"program\00", align 1
@.str.8 = private unnamed_addr constant [40 x i8] c"Wrong command!(only w,s,a,d accepted!)\0A\00", align 1
@.str.9 = private unnamed_addr constant [12 x i8] c"You loose!\0A\00", align 1
@.str.10 = private unnamed_addr constant [10 x i8] c"You win!\0A\00", align 1
@.str.11 = private unnamed_addr constant [22 x i8] c"Your solution <%42s>\0A\00", align 1
@.str.12 = private unnamed_addr constant [34 x i8] c"Iteration no. %d. Action: %c. %s\0A\00", align 1
@.str.13 = private unnamed_addr constant [9 x i8] c"Blocked!\00", align 1
@.str.14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@.str.15 = private unnamed_addr constant [11 x i8] c"You loose\0A\00", align 1

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local void @draw() #0 !dbg !17 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  call void @llvm.dbg.declare(metadata i32* %1, metadata !20, metadata !DIExpression()), !dbg !22
  call void @llvm.dbg.declare(metadata i32* %2, metadata !23, metadata !DIExpression()), !dbg !24
  store i32 0, i32* %1, align 4, !dbg !25
  br label %3, !dbg !27

3:                                                ; preds = %22, %0
  %4 = load i32, i32* %1, align 4, !dbg !28
  %5 = icmp slt i32 %4, 7, !dbg !30
  br i1 %5, label %6, label %26, !dbg !31

6:                                                ; preds = %3
  store i32 0, i32* %2, align 4, !dbg !32
  br label %7, !dbg !35

7:                                                ; preds = %10, %6
  %8 = load i32, i32* %2, align 4, !dbg !36
  %9 = icmp slt i32 %8, 11, !dbg !38
  br i1 %9, label %10, label %22, !dbg !39

10:                                               ; preds = %7
  %11 = load i32, i32* %1, align 4, !dbg !40
  %12 = sext i32 %11 to i64, !dbg !41
  %13 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %12, !dbg !41
  %14 = load i32, i32* %2, align 4, !dbg !42
  %15 = sext i32 %14 to i64, !dbg !41
  %16 = getelementptr inbounds [11 x i8], [11 x i8]* %13, i64 0, i64 %15, !dbg !41
  %17 = load i8, i8* %16, align 1, !dbg !41
  %18 = sext i8 %17 to i32, !dbg !41
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %18), !dbg !43
  %20 = load i32, i32* %2, align 4, !dbg !44
  %21 = add nsw i32 %20, 1, !dbg !44
  store i32 %21, i32* %2, align 4, !dbg !44
  br label %7, !dbg !45, !llvm.loop !46

22:                                               ; preds = %7
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !48
  %24 = load i32, i32* %1, align 4, !dbg !49
  %25 = add nsw i32 %24, 1, !dbg !49
  store i32 %25, i32* %1, align 4, !dbg !49
  br label %3, !dbg !50, !llvm.loop !51

26:                                               ; preds = %3
  %27 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.1, i64 0, i64 0)), !dbg !53
  ret void, !dbg !54
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare i32 @printf(i8*, ...) #2

; Function Attrs: noinline nounwind sspstrong uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 !dbg !55 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [28 x i8], align 16
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !60, metadata !DIExpression()), !dbg !61
  store i8** %1, i8*** %5, align 8
  call void @llvm.dbg.declare(metadata i8*** %5, metadata !62, metadata !DIExpression()), !dbg !63
  call void @llvm.dbg.declare(metadata i32* %6, metadata !64, metadata !DIExpression()), !dbg !65
  call void @llvm.dbg.declare(metadata i32* %7, metadata !66, metadata !DIExpression()), !dbg !67
  call void @llvm.dbg.declare(metadata i32* %8, metadata !68, metadata !DIExpression()), !dbg !69
  call void @llvm.dbg.declare(metadata i32* %9, metadata !70, metadata !DIExpression()), !dbg !71
  call void @llvm.dbg.declare(metadata i32* %10, metadata !72, metadata !DIExpression()), !dbg !73
  store i32 0, i32* %10, align 4, !dbg !73
  call void @llvm.dbg.declare(metadata [28 x i8]* %11, metadata !74, metadata !DIExpression()), !dbg !78
  store i32 1, i32* %6, align 4, !dbg !79
  store i32 1, i32* %7, align 4, !dbg !80
  %12 = load i32, i32* %7, align 4, !dbg !81
  %13 = sext i32 %12 to i64, !dbg !82
  %14 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %13, !dbg !82
  %15 = load i32, i32* %6, align 4, !dbg !83
  %16 = sext i32 %15 to i64, !dbg !82
  %17 = getelementptr inbounds [11 x i8], [11 x i8]* %14, i64 0, i64 %16, !dbg !82
  store i8 88, i8* %17, align 1, !dbg !84
  %18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.2, i64 0, i64 0), i32 11, i32 7), !dbg !85
  %19 = load i32, i32* %6, align 4, !dbg !86
  %20 = load i32, i32* %7, align 4, !dbg !87
  %21 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %19, i32 %20), !dbg !88
  %22 = load i32, i32* %10, align 4, !dbg !89
  %23 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i64 0, i64 0), i32 %22), !dbg !90
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([67 x i8], [67 x i8]* @.str.5, i64 0, i64 0)), !dbg !91
  %25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i64 0, i64 0)), !dbg !92
  call void @draw(), !dbg !93
  %26 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !94
  call void @klee_make_symbolic(i8* %26, i64 28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i64 0, i64 0)), !dbg !95
  br label %27, !dbg !96

27:                                               ; preds = %126, %2
  %28 = load i32, i32* %10, align 4, !dbg !97
  %29 = icmp slt i32 %28, 28, !dbg !98
  br i1 %29, label %30, label %136, !dbg !96

30:                                               ; preds = %27
  %31 = load i32, i32* %6, align 4, !dbg !99
  store i32 %31, i32* %8, align 4, !dbg !101
  %32 = load i32, i32* %7, align 4, !dbg !102
  store i32 %32, i32* %9, align 4, !dbg !103
  %33 = load i32, i32* %10, align 4, !dbg !104
  %34 = sext i32 %33 to i64, !dbg !105
  %35 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %34, !dbg !105
  %36 = load i8, i8* %35, align 1, !dbg !105
  %37 = sext i8 %36 to i32, !dbg !105
  switch i32 %37, label %50 [
    i32 119, label %38
    i32 115, label %41
    i32 97, label %44
    i32 100, label %47
  ], !dbg !106

38:                                               ; preds = %30
  %39 = load i32, i32* %7, align 4, !dbg !107
  %40 = add nsw i32 %39, -1, !dbg !107
  store i32 %40, i32* %7, align 4, !dbg !107
  br label %53, !dbg !109

41:                                               ; preds = %30
  %42 = load i32, i32* %7, align 4, !dbg !110
  %43 = add nsw i32 %42, 1, !dbg !110
  store i32 %43, i32* %7, align 4, !dbg !110
  br label %53, !dbg !111

44:                                               ; preds = %30
  %45 = load i32, i32* %6, align 4, !dbg !112
  %46 = add nsw i32 %45, -1, !dbg !112
  store i32 %46, i32* %6, align 4, !dbg !112
  br label %53, !dbg !113

47:                                               ; preds = %30
  %48 = load i32, i32* %6, align 4, !dbg !114
  %49 = add nsw i32 %48, 1, !dbg !114
  store i32 %49, i32* %6, align 4, !dbg !114
  br label %53, !dbg !115

50:                                               ; preds = %30
  %51 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.8, i64 0, i64 0)), !dbg !116
  %52 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.9, i64 0, i64 0)), !dbg !117
  call void @exit(i32 -1) #4, !dbg !118
  unreachable, !dbg !118

53:                                               ; preds = %47, %44, %41, %38
  %54 = load i32, i32* %7, align 4, !dbg !119
  %55 = sext i32 %54 to i64, !dbg !121
  %56 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %55, !dbg !121
  %57 = load i32, i32* %6, align 4, !dbg !122
  %58 = sext i32 %57 to i64, !dbg !121
  %59 = getelementptr inbounds [11 x i8], [11 x i8]* %56, i64 0, i64 %58, !dbg !121
  %60 = load i8, i8* %59, align 1, !dbg !121
  %61 = sext i8 %60 to i32, !dbg !121
  %62 = icmp eq i32 %61, 35, !dbg !123
  br i1 %62, label %63, label %67, !dbg !124

63:                                               ; preds = %53
  %64 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.10, i64 0, i64 0)), !dbg !125
  %65 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 0, !dbg !127
  %66 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.11, i64 0, i64 0), i8* %65), !dbg !128
  call void @exit(i32 1) #4, !dbg !129
  unreachable, !dbg !129

67:                                               ; preds = %53
  %68 = load i32, i32* %7, align 4, !dbg !130
  %69 = sext i32 %68 to i64, !dbg !132
  %70 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %69, !dbg !132
  %71 = load i32, i32* %6, align 4, !dbg !133
  %72 = sext i32 %71 to i64, !dbg !132
  %73 = getelementptr inbounds [11 x i8], [11 x i8]* %70, i64 0, i64 %72, !dbg !132
  %74 = load i8, i8* %73, align 1, !dbg !132
  %75 = sext i8 %74 to i32, !dbg !132
  %76 = icmp ne i32 %75, 32, !dbg !134
  br i1 %76, label %77, label %97, !dbg !135

77:                                               ; preds = %67
  %78 = load i32, i32* %7, align 4, !dbg !136
  %79 = icmp eq i32 %78, 2, !dbg !137
  br i1 %79, label %80, label %94, !dbg !138

80:                                               ; preds = %77
  %81 = load i32, i32* %7, align 4, !dbg !139
  %82 = sext i32 %81 to i64, !dbg !140
  %83 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %82, !dbg !140
  %84 = load i32, i32* %6, align 4, !dbg !141
  %85 = sext i32 %84 to i64, !dbg !140
  %86 = getelementptr inbounds [11 x i8], [11 x i8]* %83, i64 0, i64 %85, !dbg !140
  %87 = load i8, i8* %86, align 1, !dbg !140
  %88 = sext i8 %87 to i32, !dbg !140
  %89 = icmp eq i32 %88, 124, !dbg !142
  %90 = load i32, i32* %6, align 4, !dbg !143
  %91 = icmp sgt i32 %90, 0, !dbg !144
  %or.cond = and i1 %89, %91, !dbg !145
  %92 = load i32, i32* %6, align 4, !dbg !146
  %93 = icmp slt i32 %92, 11, !dbg !147
  %or.cond3 = and i1 %or.cond, %93, !dbg !145
  br i1 %or.cond3, label %97, label %94, !dbg !145

94:                                               ; preds = %80, %77
  %95 = load i32, i32* %8, align 4, !dbg !148
  store i32 %95, i32* %6, align 4, !dbg !150
  %96 = load i32, i32* %9, align 4, !dbg !151
  store i32 %96, i32* %7, align 4, !dbg !152
  br label %97, !dbg !153

97:                                               ; preds = %80, %94, %67
  %98 = load i32, i32* %6, align 4, !dbg !154
  %99 = load i32, i32* %7, align 4, !dbg !155
  %100 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.3, i64 0, i64 0), i32 %98, i32 %99), !dbg !156
  %101 = load i32, i32* %10, align 4, !dbg !157
  %102 = load i32, i32* %10, align 4, !dbg !158
  %103 = sext i32 %102 to i64, !dbg !159
  %104 = getelementptr inbounds [28 x i8], [28 x i8]* %11, i64 0, i64 %103, !dbg !159
  %105 = load i8, i8* %104, align 1, !dbg !159
  %106 = sext i8 %105 to i32, !dbg !159
  %107 = load i32, i32* %8, align 4, !dbg !160
  %108 = load i32, i32* %6, align 4, !dbg !161
  %109 = icmp eq i32 %107, %108, !dbg !162
  %110 = load i32, i32* %9, align 4, !dbg !163
  %111 = load i32, i32* %7, align 4, !dbg !163
  %112 = icmp eq i32 %110, %111, !dbg !163
  %113 = select i1 %109, i1 %112, i1 false, !dbg !163
  %114 = zext i1 %113 to i64, !dbg !164
  %115 = select i1 %113, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.13, i64 0, i64 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.14, i64 0, i64 0), !dbg !164
  %116 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.12, i64 0, i64 0), i32 %101, i32 %106, i8* %115), !dbg !165
  %117 = load i32, i32* %8, align 4, !dbg !166
  %118 = load i32, i32* %6, align 4, !dbg !168
  %119 = icmp eq i32 %117, %118, !dbg !169
  br i1 %119, label %120, label %126, !dbg !170

120:                                              ; preds = %97
  %121 = load i32, i32* %9, align 4, !dbg !171
  %122 = load i32, i32* %7, align 4, !dbg !172
  %123 = icmp eq i32 %121, %122, !dbg !173
  br i1 %123, label %124, label %126, !dbg !174

124:                                              ; preds = %120
  %125 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i64 0, i64 0)), !dbg !175
  call void @exit(i32 -2) #4, !dbg !177
  unreachable, !dbg !177

126:                                              ; preds = %120, %97
  %127 = load i32, i32* %7, align 4, !dbg !178
  %128 = sext i32 %127 to i64, !dbg !179
  %129 = getelementptr inbounds [7 x [11 x i8]], [7 x [11 x i8]]* @maze, i64 0, i64 %128, !dbg !179
  %130 = load i32, i32* %6, align 4, !dbg !180
  %131 = sext i32 %130 to i64, !dbg !179
  %132 = getelementptr inbounds [11 x i8], [11 x i8]* %129, i64 0, i64 %131, !dbg !179
  store i8 88, i8* %132, align 1, !dbg !181
  call void @draw(), !dbg !182
  %133 = load i32, i32* %10, align 4, !dbg !183
  %134 = add nsw i32 %133, 1, !dbg !183
  store i32 %134, i32* %10, align 4, !dbg !183
  %135 = call i32 (i32, ...) bitcast (i32 (...)* @sleep to i32 (i32, ...)*)(i32 1), !dbg !184
  br label %27, !dbg !96, !llvm.loop !185

136:                                              ; preds = %27
  %137 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.15, i64 0, i64 0)), !dbg !187
  %138 = load i32, i32* %3, align 4, !dbg !188
  ret i32 %138, !dbg !188
}

declare void @klee_make_symbolic(i8*, i64, i8*) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

declare i32 @sleep(...) #2

attributes #0 = { noinline nounwind sspstrong uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!11, !12, !13, !14, !15}
!llvm.ident = !{!16}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "maze", scope: !2, file: !3, line: 21, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 10.0.0 ", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "maze.c", directory: "/home/anig/study/2020-Spring/Sec/SDL/klee/examples/tutorial3")
!4 = !{}
!5 = !{!0}
!6 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 616, elements: !8)
!7 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!8 = !{!9, !10}
!9 = !DISubrange(count: 7)
!10 = !DISubrange(count: 11)
!11 = !{i32 7, !"Dwarf Version", i32 4}
!12 = !{i32 2, !"Debug Info Version", i32 3}
!13 = !{i32 1, !"wchar_size", i32 4}
!14 = !{i32 7, !"PIC Level", i32 2}
!15 = !{i32 7, !"PIE Level", i32 2}
!16 = !{!"clang version 10.0.0 "}
!17 = distinct !DISubprogram(name: "draw", scope: !3, file: !3, line: 32, type: !18, scopeLine: 33, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!18 = !DISubroutineType(types: !19)
!19 = !{null}
!20 = !DILocalVariable(name: "i", scope: !17, file: !3, line: 34, type: !21)
!21 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!22 = !DILocation(line: 34, column: 6, scope: !17)
!23 = !DILocalVariable(name: "j", scope: !17, file: !3, line: 34, type: !21)
!24 = !DILocation(line: 34, column: 9, scope: !17)
!25 = !DILocation(line: 35, column: 9, scope: !26)
!26 = distinct !DILexicalBlock(scope: !17, file: !3, line: 35, column: 2)
!27 = !DILocation(line: 35, column: 7, scope: !26)
!28 = !DILocation(line: 35, column: 14, scope: !29)
!29 = distinct !DILexicalBlock(scope: !26, file: !3, line: 35, column: 2)
!30 = !DILocation(line: 35, column: 16, scope: !29)
!31 = !DILocation(line: 35, column: 2, scope: !26)
!32 = !DILocation(line: 37, column: 12, scope: !33)
!33 = distinct !DILexicalBlock(scope: !34, file: !3, line: 37, column: 5)
!34 = distinct !DILexicalBlock(scope: !29, file: !3, line: 36, column: 4)
!35 = !DILocation(line: 37, column: 10, scope: !33)
!36 = !DILocation(line: 37, column: 17, scope: !37)
!37 = distinct !DILexicalBlock(scope: !33, file: !3, line: 37, column: 5)
!38 = !DILocation(line: 37, column: 19, scope: !37)
!39 = !DILocation(line: 37, column: 5, scope: !33)
!40 = !DILocation(line: 38, column: 26, scope: !37)
!41 = !DILocation(line: 38, column: 21, scope: !37)
!42 = !DILocation(line: 38, column: 29, scope: !37)
!43 = !DILocation(line: 38, column: 7, scope: !37)
!44 = !DILocation(line: 37, column: 25, scope: !37)
!45 = !DILocation(line: 37, column: 5, scope: !37)
!46 = distinct !{!46, !39, !47}
!47 = !DILocation(line: 38, column: 31, scope: !33)
!48 = !DILocation(line: 39, column: 5, scope: !34)
!49 = !DILocation(line: 35, column: 22, scope: !29)
!50 = !DILocation(line: 35, column: 2, scope: !29)
!51 = distinct !{!51, !31, !52}
!52 = !DILocation(line: 40, column: 4, scope: !26)
!53 = !DILocation(line: 41, column: 2, scope: !17)
!54 = !DILocation(line: 42, column: 1, scope: !17)
!55 = distinct !DISubprogram(name: "main", scope: !3, file: !3, line: 49, type: !56, scopeLine: 50, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !2, retainedNodes: !4)
!56 = !DISubroutineType(types: !57)
!57 = !{!21, !21, !58}
!58 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !59, size: 64)
!59 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!60 = !DILocalVariable(name: "argc", arg: 1, scope: !55, file: !3, line: 49, type: !21)
!61 = !DILocation(line: 49, column: 11, scope: !55)
!62 = !DILocalVariable(name: "argv", arg: 2, scope: !55, file: !3, line: 49, type: !58)
!63 = !DILocation(line: 49, column: 23, scope: !55)
!64 = !DILocalVariable(name: "x", scope: !55, file: !3, line: 51, type: !21)
!65 = !DILocation(line: 51, column: 6, scope: !55)
!66 = !DILocalVariable(name: "y", scope: !55, file: !3, line: 51, type: !21)
!67 = !DILocation(line: 51, column: 9, scope: !55)
!68 = !DILocalVariable(name: "ox", scope: !55, file: !3, line: 52, type: !21)
!69 = !DILocation(line: 52, column: 6, scope: !55)
!70 = !DILocalVariable(name: "oy", scope: !55, file: !3, line: 52, type: !21)
!71 = !DILocation(line: 52, column: 10, scope: !55)
!72 = !DILocalVariable(name: "i", scope: !55, file: !3, line: 53, type: !21)
!73 = !DILocation(line: 53, column: 6, scope: !55)
!74 = !DILocalVariable(name: "program", scope: !55, file: !3, line: 55, type: !75)
!75 = !DICompositeType(tag: DW_TAG_array_type, baseType: !7, size: 224, elements: !76)
!76 = !{!77}
!77 = !DISubrange(count: 28)
!78 = !DILocation(line: 55, column: 10, scope: !55)
!79 = !DILocation(line: 58, column: 4, scope: !55)
!80 = !DILocation(line: 59, column: 4, scope: !55)
!81 = !DILocation(line: 60, column: 10, scope: !55)
!82 = !DILocation(line: 60, column: 5, scope: !55)
!83 = !DILocation(line: 60, column: 13, scope: !55)
!84 = !DILocation(line: 60, column: 15, scope: !55)
!85 = !DILocation(line: 63, column: 5, scope: !55)
!86 = !DILocation(line: 64, column: 36, scope: !55)
!87 = !DILocation(line: 64, column: 39, scope: !55)
!88 = !DILocation(line: 64, column: 5, scope: !55)
!89 = !DILocation(line: 65, column: 34, scope: !55)
!90 = !DILocation(line: 65, column: 5, scope: !55)
!91 = !DILocation(line: 66, column: 5, scope: !55)
!92 = !DILocation(line: 67, column: 5, scope: !55)
!93 = !DILocation(line: 70, column: 5, scope: !55)
!94 = !DILocation(line: 72, column: 24, scope: !55)
!95 = !DILocation(line: 72, column: 5, scope: !55)
!96 = !DILocation(line: 76, column: 2, scope: !55)
!97 = !DILocation(line: 76, column: 8, scope: !55)
!98 = !DILocation(line: 76, column: 10, scope: !55)
!99 = !DILocation(line: 79, column: 10, scope: !100)
!100 = distinct !DILexicalBlock(scope: !55, file: !3, line: 77, column: 4)
!101 = !DILocation(line: 79, column: 8, scope: !100)
!102 = !DILocation(line: 80, column: 10, scope: !100)
!103 = !DILocation(line: 80, column: 8, scope: !100)
!104 = !DILocation(line: 82, column: 21, scope: !100)
!105 = !DILocation(line: 82, column: 13, scope: !100)
!106 = !DILocation(line: 82, column: 5, scope: !100)
!107 = !DILocation(line: 85, column: 9, scope: !108)
!108 = distinct !DILexicalBlock(scope: !100, file: !3, line: 83, column: 7)
!109 = !DILocation(line: 86, column: 8, scope: !108)
!110 = !DILocation(line: 88, column: 9, scope: !108)
!111 = !DILocation(line: 89, column: 8, scope: !108)
!112 = !DILocation(line: 91, column: 9, scope: !108)
!113 = !DILocation(line: 92, column: 8, scope: !108)
!114 = !DILocation(line: 94, column: 9, scope: !108)
!115 = !DILocation(line: 95, column: 8, scope: !108)
!116 = !DILocation(line: 97, column: 11, scope: !108)
!117 = !DILocation(line: 98, column: 11, scope: !108)
!118 = !DILocation(line: 99, column: 11, scope: !108)
!119 = !DILocation(line: 103, column: 14, scope: !120)
!120 = distinct !DILexicalBlock(scope: !100, file: !3, line: 103, column: 9)
!121 = !DILocation(line: 103, column: 9, scope: !120)
!122 = !DILocation(line: 103, column: 17, scope: !120)
!123 = !DILocation(line: 103, column: 20, scope: !120)
!124 = !DILocation(line: 103, column: 9, scope: !100)
!125 = !DILocation(line: 105, column: 8, scope: !126)
!126 = distinct !DILexicalBlock(scope: !120, file: !3, line: 104, column: 7)
!127 = !DILocation(line: 106, column: 41, scope: !126)
!128 = !DILocation(line: 106, column: 8, scope: !126)
!129 = !DILocation(line: 107, column: 8, scope: !126)
!130 = !DILocation(line: 110, column: 14, scope: !131)
!131 = distinct !DILexicalBlock(scope: !100, file: !3, line: 110, column: 9)
!132 = !DILocation(line: 110, column: 9, scope: !131)
!133 = !DILocation(line: 110, column: 17, scope: !131)
!134 = !DILocation(line: 110, column: 20, scope: !131)
!135 = !DILocation(line: 111, column: 9, scope: !131)
!136 = !DILocation(line: 112, column: 12, scope: !131)
!137 = !DILocation(line: 112, column: 14, scope: !131)
!138 = !DILocation(line: 112, column: 19, scope: !131)
!139 = !DILocation(line: 112, column: 27, scope: !131)
!140 = !DILocation(line: 112, column: 22, scope: !131)
!141 = !DILocation(line: 112, column: 30, scope: !131)
!142 = !DILocation(line: 112, column: 33, scope: !131)
!143 = !DILocation(line: 112, column: 43, scope: !131)
!144 = !DILocation(line: 112, column: 45, scope: !131)
!145 = !DILocation(line: 112, column: 40, scope: !131)
!146 = !DILocation(line: 112, column: 52, scope: !131)
!147 = !DILocation(line: 112, column: 54, scope: !131)
!148 = !DILocation(line: 114, column: 12, scope: !149)
!149 = distinct !DILexicalBlock(scope: !131, file: !3, line: 113, column: 7)
!150 = !DILocation(line: 114, column: 10, scope: !149)
!151 = !DILocation(line: 115, column: 12, scope: !149)
!152 = !DILocation(line: 115, column: 10, scope: !149)
!153 = !DILocation(line: 116, column: 7, scope: !149)
!154 = !DILocation(line: 119, column: 42, scope: !100)
!155 = !DILocation(line: 119, column: 45, scope: !100)
!156 = !DILocation(line: 119, column: 11, scope: !100)
!157 = !DILocation(line: 120, column: 56, scope: !100)
!158 = !DILocation(line: 120, column: 66, scope: !100)
!159 = !DILocation(line: 120, column: 58, scope: !100)
!160 = !DILocation(line: 120, column: 72, scope: !100)
!161 = !DILocation(line: 120, column: 76, scope: !100)
!162 = !DILocation(line: 120, column: 74, scope: !100)
!163 = !DILocation(line: 120, column: 78, scope: !100)
!164 = !DILocation(line: 120, column: 71, scope: !100)
!165 = !DILocation(line: 120, column: 11, scope: !100)
!166 = !DILocation(line: 123, column: 15, scope: !167)
!167 = distinct !DILexicalBlock(scope: !100, file: !3, line: 123, column: 15)
!168 = !DILocation(line: 123, column: 19, scope: !167)
!169 = !DILocation(line: 123, column: 17, scope: !167)
!170 = !DILocation(line: 123, column: 21, scope: !167)
!171 = !DILocation(line: 123, column: 24, scope: !167)
!172 = !DILocation(line: 123, column: 28, scope: !167)
!173 = !DILocation(line: 123, column: 26, scope: !167)
!174 = !DILocation(line: 123, column: 15, scope: !100)
!175 = !DILocation(line: 124, column: 17, scope: !176)
!176 = distinct !DILexicalBlock(scope: !167, file: !3, line: 123, column: 30)
!177 = !DILocation(line: 125, column: 17, scope: !176)
!178 = !DILocation(line: 128, column: 16, scope: !100)
!179 = !DILocation(line: 128, column: 11, scope: !100)
!180 = !DILocation(line: 128, column: 19, scope: !100)
!181 = !DILocation(line: 128, column: 21, scope: !100)
!182 = !DILocation(line: 130, column: 5, scope: !100)
!183 = !DILocation(line: 132, column: 6, scope: !100)
!184 = !DILocation(line: 134, column: 5, scope: !100)
!185 = distinct !{!185, !96, !186}
!186 = !DILocation(line: 135, column: 4, scope: !55)
!187 = !DILocation(line: 137, column: 1, scope: !55)
!188 = !DILocation(line: 138, column: 1, scope: !55)
