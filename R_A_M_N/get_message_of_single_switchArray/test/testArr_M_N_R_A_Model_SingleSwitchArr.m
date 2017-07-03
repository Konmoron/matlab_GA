%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于储存testArr_M_N_R_A_Model_SingleSwitchArr所需的数组 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本只是用于产生一个数组SwitchArray_For_M_N_R_A_Model
        % ---- 这个数组SwitchArray_For_M_N_R_A_Model包含3个数组
            % ---- 每个数组由0和1组成
                % ---- 0代表开关断开
                % ---- 1代表开关闭合
                % ---- 数组的长度由开关的个数决定
                    % ---- 开关的个数在modelParametersFor_M_N_R_A里面有具体的介绍
            
            
%% ---- 声明全局变量
    global numOfSwitch;
%% ---- 创建开关组合1：SwitchArray1，此开关组合代表开关全部断开
    SwitchArray1 = zeros(1, numOfSwitch);
%% ---- 创建开关组合2：SwitchArray2，此开关组合代表开关全部闭合
    SwitchArray2 = ones(1, numOfSwitch);
%% ---- 创建开关组合3：SwitchArray3，此开关组合代表随机的开关组合
    %{
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
            rand是生成0-1之间的随机数
            rand(1, num)是生成一行有num个数的0-1之间的随机数
            round是四舍五入
            因此round(rand(1, num))得到的是具有num个数的0或者1数组
        ---- 注意 ----
        ---- 注意 ----
        ---- 注意 ----
    %}
    SwitchArray3 = round(rand(1, numOfSwitch));
%% ---- 将所有开关组合存入一个数组中
    % ---- 定义SwitchArrayOf_Only_M_N_R_A_Model
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
               SwitchArray_For_M_N_R_A_Model(1, :)代表SwitchArray1，其他以此类推
                    其中，
                        SwitchArray1代表开关全部断开
                        SwitchArray2代表开关全部闭合
                        SwitchArray3代表随机的开关组合
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        SwitchArray_For_M_N_R_A_Model = [SwitchArray1; SwitchArray2; SwitchArray3];
        % ---- 得到行数和列数，其中rowNumOfArr代表行数，numOfSwitchArr代表列数
        [rowNumOfArr, numOfSwitchArr] = size(SwitchArray_For_M_N_R_A_Model);
% %% ---- 测试
%             [m, n] = size(SwitchArray_For_M_N_R_A_Model);
%             disp(m)
%             disp(n)
%             for ii = 1:1:m
%                 fprintf('当前的开关组合：');
%                 fprintf('%.0f ', SwitchArray_For_M_N_R_A_Modell(ii, :));
%                 fprintf('\n');
%             end