%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于设置遗传算法的一些参数 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本的主要作用是：
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            % ---- 1.设置遗传算法的一些参数
            %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
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
%% ---- 定义全局变量
    global PopulationSize
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
    PopulationType = 'bitstring';
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
        PopulationSize = 50;
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
    % ---- 定义EliteCount
        EliteCount = ceil(0.05*PopulationSize); % ---- EliteCount必须为正整数
    % ---- 设置EliteCount
        options = gaoptimset(options, 'EliteCount', EliteCount);
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
        Generations = 10;
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
        FitnessLimit = -100;
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
    % ---- 定义Score diversity（多样性值），画出每一代的得分直方图。
        PlotFcnsScoreDiversity = @gaplotscorediversity;
    % ---- 定义Scores，画出每一代中个体的得分。
        PlotFcnsScores = @gaplotscores;
    % ---- 定义Range，画出每一代中最大、最小、平均适应函数值。
        PlotFcnsRange = @gaplotrange;
    % ---- 设置图形参数PlotFcns
        options = gaoptimset(options, 'PlotFcns', {PlotFcnsOfBestFitness, PlotFcnsScoreDiversity, PlotFcnsScores, PlotFcnsRange});