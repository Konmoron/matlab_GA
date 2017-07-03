%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于测试遗传算法的options选项，及其设置 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.测试遗传算法的options选项
            % ---- 2.对遗传算法的options选项进行设置
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
    %{
        遗传算法的参数选项，以及默认选项（{}内是默认选项）：
            PopulationType: [ 'bitstring'      | 'custom'    | {'doubleVector'} ]
                    Population type（PopulationType)指定适应度函数的输入数据类型，可用来设置的Population type为以下值之一：
                    (1)	Double Vector（双精度向量) ('doubleVector')：如果种群中的个体是双精度类型时使用，它是缺省值。
                    (2)	Bit string（位串) ('bitstring')：如果种群中的个体是位串类型时使用。
                    (3)	Custom（自定义）('custom')：如果种群中的个体不是前面两种类型时使用。
                    (4)	如果使用Custom ('custom')类型，必须自己编写创建、变异和交叉函数来接受这种类型种群输入，并分别在下列域中指定这些函数：
                    ?	创建函数（Creation function ) (CreationFcn)；
                    ?	变异函数（Mutation function) (MutationFcn)；
                    ?	交叉函数（Crossover function) (CrossoverFcn)。
            PopInitRange: [ matrix           | {[-10;10]} ]
                    Initial range  (PopInitRange)：指定被创建函数生成的初始种群向量范围，能使用一具有两行Number of variables列矩阵设置Initial range，
                    每一列具有[lb; ub]形式，这里lb是相对项目的下界，而ub是上界。如果指定Initial range是2×1向量，则每个条目均被扩展，行长度不变，即行长度为Number of variables。
            PopulationSize: [ positive scalar ]
                    Population size (PopulationSize)指定在每一代中有多少个个体，使用大的种群尺度，遗传算法搜索解空间能更加彻底，
                    同时减少返回局部最小值而不是全局最小值的机会，然而使用大的种群尺度，会使遗传算法运行更慢。
            
            EliteCount: [ positive scalar  | {0.05*PopulationSize} ]
                    Elite count  (EliteCount)——指定将生存到下一代的个体数，设置Elite count为一个小于或等于种群尺度的正整数，其缺省值是0.05*PopulationSize。
            CrossoverFraction: [ positive scalar  | {0.8} ]
                    Crossover fraction  (CrossoverFraction)——指定下一代中不同于原种群的部分，它们由交叉产生。
                    Crossover fraction是一个0到1之间的小数，可为输入在文本框中的小数或在滑槽移动的小数。其缺省值是0.8。

            ParetoFraction: [ positive scalar  | {0.35} ]
                    

            MigrationDirection: [ 'both'           | {'forward'} ]
                    (1)	“Direction（方向）” (MigrationDirection)——迁移发生在一个或两个方向。
                    如果设置“Direction”为Forward ( 'forward')，则迁移发生在下一个种群，也就是第N个子种群迁移到第N+1个子种群。
                    如果设置“Direction”为Both ('both')，则第N个子种群迁移到第N-1个子种群和N＋1个子种群。
                    迁移在最后一个子种群处将卷绕回来，即最后一个子种群迁移到第一个子种群，第一个迁可以迁移到最后一个子种群。
                    为了防止卷绕，在确定的种群尺度下，在种群尺度向量的最后添加一0项，指示一大小为0的子种群。
            MigrationInterval: [ positive scalar  | {20} ]
                    “Interval（间隔）” (MigrationInterval)——指明在两次迁移间要经过多少代，例如设置Interval为20，则每隔20代就发生迁移。
            MigrationFraction: [ positive scalar  | {0.2} ]
                    “Fraction（百分比）” (MigrationFraction)——指明在两个子种群间有多少个个体迁移。“百分比”指明两个迁移子种群中较小子种群的个体迁移百分比。
                    例如：如果个体从一个有50个个体的子种群迁移到一个有100个个体的子种群中，且fraction设置为0.1，则发生迁移的个体数是0.1 * 50 = 5。

            Generations: [ positive scalar ]
                    “Generations”——指明算法最大重复执行次数，缺省值是100；
            TimeLimit: [ positive scalar  | {Inf} ]
            FitnessLimit: [ scalar           | {-Inf} ]
                    Fitness limit（适应度限）” ( FitnessLimit)——最好适应度值小于或等于“适应度限（Fitness limit）”则算法终止；
            StallGenLimit: [ positive scalar ]
            StallTest: [ 'geometricWeighted' | {'averageChange'} ]
            StallTimeLimit: [ positive scalar  | {Inf} ]
            TolFun: [ positive scalar ]
            TolCon: [ positive scalar  | {1e-6} ]

            InitialPopulation: [ matrix           | {[]} ]
            InitialScores: [ column vector    | {[]} ]

            NonlinConAlgorithm: [ 'penalty' | {'auglag'} ]
            InitialPenalty: [ positive scalar | {10} ]
            PenaltyFactor: [ positive scalar | {100} ]

            CreationFcn: [ function_handle  | @gacreationuniform | @gacreationlinearfeasible ]
            FitnessScalingFcn: [ function_handle  | @fitscalingshiftlinear  | @fitscalingprop  | 
                            @fitscalingtop   | {@fitscalingrank} ]
                    1.Rank（排列）(@fitscalingrank)——缺省的适应度比例函数。Rank函数根据个体适应度值的排列顺序而不是根据个体适应度值的大小来衡量个体的优劣。
                      个体的排列是按个体适应度值排序后的位置。最适合个体的排序为1，次最适合个体的排序为2，依此类推。Rank函数对适应度比例进行排序，从而消除了原始适应度值的影响。
                    2.Proportional（比率）(@fitscalingprop)——比率的计算使个体的适应度比例大小与它的适应度值成比例。

            SelectionFcn: [ function_handle  | @selectionremainder    | @selectionuniform | 
                            @selectionroulette | @selectiontournament   | @selectionstochunif ]
                    Stochastic uniform（随机均匀分布） (@selectionstochunif)——缺省的选择函数为Stochastic uniform函数，布局在一条线上，每一父辈根据其刻度值按比率对应线上的一部分。
                    算法以相同大小的步长沿线移动。在每一步，算法根据降落的位置确定一父辈，第一步是一小于步长的均匀随机值。
                    
            CrossoverFcn: [ function_handle  | @crossoverheuristic  | @crossoverintermediate | 
                            @crossoversinglepoint | @crossovertwopoint | @crossoverarithmetic | 
                            @crossoverscattered ]
                    Scattered（分散）(@crossoverscattered)：这是一个缺省的交叉函数，它创建一个二进制向量，这个向量某位是1，则这个基因从第一个父辈中来，如为0则从第二个父辈中来，组合这些基因而形成一子个体。例如：P1，P2是父辈，
                        p1 = [a b c d e f g h] 
                        p2 = [1 2 3 4 5 6 7 8] 
                        这个二进制向量是[1 1 0 0 1 0 0 0]，则函数返回如下子辈个体：
                        child1 = [a b 3 4 e 6 7 8]

            MutationFcn: [ function_handle  | @mutationuniform | @mutationadaptfeasible | 
                            @mutationgaussian ]
                    Gaussian（高斯函数）(mutationgaussian)——这是缺省的变异函数“Gaussian”，把一高斯分布、具有均值0的随机数加到父向量的每一项。
                    这个分布的变化由参数“Scale” 和“Shrink（压缩）” 决定。如果选择Gaussian，它们将显示出来，且在“Population” 参数中按照“Initial range”进行设置。
            
            DistanceMeasureFcn: [ function_handle  | {@distancecrowding} ]
            HybridFcn: [ @fminsearch | @patternsearch | @fminunc | @fmincon | {[]} ]

            Display: [ 'off' | 'iter' | 'diagnose' | {'final'} ]
                    
            OutputFcns: [ function_handle  | {[]} ]
            
            PlotFcns: [ function_handle  | @gaplotbestf | @gaplotbestindiv | @gaplotdistance | 
                            @gaplotexpectation | @gaplotgenealogy | @gaplotselection | @gaplotrange | 
                            @gaplotscorediversity  | @gaplotscores | @gaplotstopping  | 
                            @gaplotmaxconstr | @gaplotrankhist | @gaplotpareto | @gaplotspread | 
                            @gaplotparetodistance |{[]} ]
                    Best fitness (@gaplotbestf) 画出最佳函数值与代数对。
                    Expectation（期望值）(@gaplotexpectation)画出与每一代原始得分对应的期望的子代数。
                    Score diversity（多样性值）(@gaplotscorediversity)画出每一代的得分直方图。
                    Stopping（停止）(@plotstopping)画出停止条件水平。
                    Best individual(@gaplotbestindiv)画出每代中最佳适应度函数个体的向量值。
                    Genealogy（家系）(@gaplotgenealogy)画出个体的谱系。从一代到下一代线条颜色代码如下：红线指变异的子辈；蓝线表示交叉的子辈；黑线表示原始的个体。
                    Scores(@gaplotscores) 画出每一代中个体的得分。
                    Distance(@gaplotdistance) 画出每一代中个体间的平均距离。
                    Range(@gaplotrange) 画出每一代中最大、最小、平均适应函数值。
                    Selection(@gaplotselection) 画出双亲的直方图。

            PlotInterval: [ positive scalar  | {1} ]

            Vectorized: [ 'on'  | {'off'} ]

            UseParallel: [ logical scalar | true | {false} ]
    %}

            
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            官方推荐使用下面这种方式设置参数：
                options = gaoptimset(options, 'PopulationSize', 30);
                    括号内的options是前面设置的options
            当然，使用（options.PopulationSize = 30;）这种方式也是可以的
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
%% ---- clear and close
    clc;
    clear;
    close all;
%% ---- 加载load数据mat文件
    load('test.mat');
%% ---- 还愿以前的仿真参数，以便得到以前的仿真结果
    stream = RandStream.getGlobalStream;
    stream.State = output.rngstate.state;
%% ---- 得到遗传算法的options选项
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            遗传算法options调用接口是gaoptimset
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    options = gaoptimset;
%% ---- 设置种群类型
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            可重构天线每个开关的断开和闭合用0和1表示，所以采用bitstring的种群类型
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    PopulationType = 'doubleVector';
    options = gaoptimset(options, 'PopulationType', PopulationType);
%% ---- 设置种群大小
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            Elite count  (EliteCount)——指定将生存到下一代的个体数，设置Elite count为一个小于或等于种群尺度的正整数
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- 定义种群大小
        PopulationSize = 40;
    % ---- 设置种群大小
        options = gaoptimset(options, 'PopulationSize', PopulationSize);
%% ---- 设置EliteCount
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            Elite count  (EliteCount)——指定将生存到下一代的个体数，设置Elite count为一个小于或等于种群尺度的正整数
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    options = gaoptimset(options, 'EliteCount', 0.05*PopulationSize);
%% ---- 设置CrossoverFraction
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            Crossover fraction  (CrossoverFraction)——指定下一代中不同于原种群的部分，它们由交叉产生。
            Crossover fraction是一个0到1之间的小数，可为输入在文本框中的小数或在滑槽移动的小数。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- 定义CrossoverFraction
        CrossoverFraction  = 0.8;
    % ---- 设置CrossoverFraction
        options = gaoptimset(options, 'CrossoverFraction', CrossoverFraction);
%% ---- 设置MigrationDirection
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            “Direction（方向）” (MigrationDirection)——迁移发生在一个或两个方向。
                如果设置“Direction”为Forward ( 'forward')，则迁移发生在下一个种群，也就是第N个子种群迁移到第N+1个子种群。
                如果设置“Direction”为Both ('both')，则第N个子种群迁移到第N-1个子种群和N＋1个子种群。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- 定义MigrationDirection
        MigrationDirection = 'forward';
    % ---- 设置MigrationDirection
        options = gaoptimset(options, 'MigrationDirection', MigrationDirection);
%% ---- 设置MigrationInterval
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            “Interval（间隔）” (MigrationInterval)——指明在两次迁移间要经过多少代，例如设置Interval为20，则每隔20代就发生迁移。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- 定义MigrationInterval
        MigrationInterval = 20;
    % ---- 设置MigrationInterval
        options = gaoptimset(options, 'MigrationInterval', MigrationInterval);
%% ---- 设置MigrationFraction
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            “Fraction（百分比）” (MigrationFraction)——指明在两个子种群间有多少个个体迁移。“百分比”指明两个迁移子种群中较小子种群的个体迁移百分比。
                例如：如果个体从一个有50个个体的子种群迁移到一个有100个个体的子种群中，且fraction设置为0.1，则发生迁移的个体数是0.1 * 50 = 5。
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    % ---- 定义MigrationFraction
        MigrationFraction = 0.2;
    % ---- 设置MigrationFraction
        options = gaoptimset(options, 'MigrationFraction', MigrationFraction);
%% ---- 设置停止条件
    % ---- 设置最大代数Generations
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Generations——指明算法最大重复执行次数
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        Generations = 100;
    % ---- 设置FitnessLimit
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Fitness limit（适应度限）” ( FitnessLimit)——最好适应度值小于或等于“适应度限（Fitness limit）”则算法终止；
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        FitnessLimit = 0;
    % ---- 设置停止条件
        options = gaoptimset(options, 'Generations', Generations, 'FitnessLimit', FitnessLimit);
%% ---- 设置适应度比例参数FitnessScalingFcn
    % ---- 定义适应度比例函数
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Rank（排列）：Rank函数根据个体适应度值的排列顺序而不是根据个体适应度值的大小来衡量个体的优劣。
                个体的排列是按个体适应度值排序后的位置。最适合个体的排序为1，次最适合个体的排序为2，依此类推。
                Rank函数对适应度比例进行排序，从而消除了原始适应度值的影响。
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        FitnessScalingFcn = @fitscalingrank;
    % ---- 设置适应度比例参数FitnessScalingFcn
        options = gaoptimset(options, 'FitnessScalingFcn', FitnessScalingFcn);
%% ---- 设置选择参数SelectionFcn
    % ---- 定义SelectionFcn函数
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Stochastic uniform（随机均匀分布） (@selectionstochunif)——布局在一条线上，每一父辈根据其刻度值按比率对应线上的一部分。
                算法以相同大小的步长沿线移动。在每一步，算法根据降落的位置确定一父辈，第一步是一小于步长的均匀随机值。
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        SelectionFcn = @selectionstochunif;
    % ---- 设置选择参数SelectionFcn
        options = gaoptimset(options, 'SelectionFcn', SelectionFcn);
%% ---- 设置交叉参数CrossoverFcn
    % ---- 定义交叉函数
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Scattered（分散）(@crossoverscattered)：它创建一个二进制向量，这个向量某位是1，则这个基因从第一个父辈中来，如为0则从第二个父辈中来，组合这些基因而形成一子个体。例如：P1，P2是父辈，
                    p1 = [a b c d e f g h] 
                    p2 = [1 2 3 4 5 6 7 8] 
                    这个二进制向量是[1 1 0 0 1 0 0 0]，则函数返回如下子辈个体：
                    child1 = [a b 3 4 e 6 7 8]
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        CrossoverFcn = @crossoverscattered;
    % ---- 设置交叉参数CrossoverFcn
        options = gaoptimset(options, 'CrossoverFcn', CrossoverFcn);
%% ---- 设置变异参数MutationFcn
    % ---- 定义MutationFcn函数
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Gaussian（高斯函数）(mutationgaussian)——这是缺省的变异函数“Gaussian”，把一高斯分布、具有均值0的随机数加到父向量的每一项。
                    这个分布的变化由参数“Scale” 和“Shrink（压缩）” 决定。如果选择Gaussian，它们将显示出来，且在“Population” 参数中按照“Initial range”进行设置。
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        MutationFcn = @mutationgaussian;
    % ---- 设置变异参数MutationFcn
        options = gaoptimset(options, 'MutationFcn', MutationFcn);
%% ---- 设置显示到命令窗口参数Display
    % ---- 定义Display
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Iterative ('iter')——显示每一次迭代的有关信息。
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        Display = 'iter';
    % ---- 设置显示到命令窗口参数Display
        options = gaoptimset(options, 'Display', Display);
%% ---- 设置图形参数PlotFcns
    % ---- 定义Best fitness
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                画出最佳函数值与代数对。
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        PlotFcnsOfBestFitness = @gaplotbestf;
    % ---- 定义Expectation（期望值），画出与每一代原始得分对应的期望的子代数。
        PlotFcnsExpectation = @gaplotexpectation;
    % ---- 定义Score diversity（多样性值），画出每一代的得分直方图。
        PlotFcnsScoreDiversity = @gaplotscorediversity;
    % ---- 定义Best individual，画出每代中最佳适应度函数个体的向量值。
        PlotFcnsBestIndividual = @gaplotbestindiv;
    % ---- 定义Genealogy（家系），画出个体的谱系。从一代到下一代线条颜色代码如下：红线指变异的子辈；蓝线表示交叉的子辈；黑线表示原始的个体。
        PlotFcnsGenealogy = @gaplotgenealogy;
    % ---- 定义Scores，画出每一代中个体的得分。
        PlotFcnsScores = @gaplotscores;
    % ---- 定义Distance，画出每一代中个体间的平均距离。
        PlotFcnsDistance = @gaplotdistance;
    % ---- 定义Range，画出每一代中最大、最小、平均适应函数值。
        PlotFcnsRange = @gaplotrange;
    % ---- 定义Selection，画出双亲的直方图。
        PlotFcnsSelection = @gaplotselection;
    % ---- 设置图形参数PlotFcns
        options = gaoptimset(options, 'PlotFcns', {PlotFcnsOfBestFitness, PlotFcnsScoreDiversity, PlotFcnsScores, PlotFcnsRange});
%% ---- 设置目标函数
    FitnessFcn = @rastriginsfcn;
%% ---- 定义变量的个数，也就是基因的个数，在可重构天线里面代表开关的个数
    GenomeLength = 2;
%% ---- 运行ga
    [pop, fival, exitflag, output] = ga(FitnessFcn, GenomeLength, options);
% %% ---- 输出options选项
%     disp(options);
%% ---- 输出结果
    fprintf('%.0f ', pop);
    fprintf('\n%.0f ', fival);
    fprintf('\n%.0f\n', exitflag);
    disp(output);
%% ---- 保存仿真结果
    %{ 
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            保存的仿真结果可以通过下面的方式调用，以便得到同样的仿真数据
                %% ---- 加载load数据mat文件
                    load('test.mat');
                %% ---- 还愿以前的仿真参数，以便得到以前的仿真结果
                    stream = RandStream.getGlobalStream;
                    stream.State = output.rngstate.state;
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    save('..\graduation_projects\data_file\test\test.mat');