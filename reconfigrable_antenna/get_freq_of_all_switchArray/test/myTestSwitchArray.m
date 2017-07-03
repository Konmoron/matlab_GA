%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于产生一个临时的数组myTestSwitchArray，用于测试模型的建立 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本只是用于产生一个数组myTestSwitchArray
        % ---- 这个数组myTestSwitchArray只有0和1两个元素
            % ---- 0代表开关断开
            % ---- 1代表开关闭合
            
            
        % ---- 数组元素的个数为12个，分别对应12个开关
            % ---- 索引(1)代表Switch11
            % ---- 索引(2)代表Switch12
            
            % ---- 索引(3)代表Switch21
            % ---- 索引(4)代表Switch22
            % ---- 索引(5)代表Switch23
            
            % ---- 索引(6)代表Switch31
            % ---- 索引(7)代表Switch32
            
            % ---- 索引(8)代表Switch41
            % ---- 索引(9)代表Switch42
            % ---- 索引(10)代表Switch43
            
            % ---- 索引(11)代表Switch51
            % ---- 索引(12)代表Switch52
            
            
%% ---- 创建数组allSwitchOnSwitchArray
    % ---- 所有开关全部闭合
    allSwitchOnSwitchArray = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1];
    
%     fprintf('定义数组allSwitchOnSwitchArray---->完毕\n\n');
%% ---- 创建数组allSwitchOffSwitchArray
    % ---- 所有开关全部断开
    allSwitchOffSwitchArray = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
    
%     fprintf('定义数组allSwitchOffSwitchArray---->完毕\n\n');
%% ---- 创建数组switchModelOneSwitchArray
    %{
        Switch11开关断开
        Switch12开关闭合

        Switch21开关断开
        Switch22开关闭合
        Switch23开关断开

        Switch31开关闭合
        Switch32开关断开

        Switch41开关闭合
        Switch42开关断开
        Switch43开关闭合

        Switch51开关断开
        Switch52开关闭合
    %}
        
    switchModelOneSwitchArray = [0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1];
%% ---- 其他开关组合
%     switchModelOneSwitchArray1 = [0 0 0 0 0 0 0 0 1 1 1 1];
%     switchModelOneSwitchArray2 = [0 0 0 0 0 0 1 0 1 0 0 0];
%     switchModelOneSwitchArray3 = [0 0 0 0 0 1 1 1 1 0 1 1];
%     switchModelOneSwitchArray4 = [0 0 0 0 1 0 0 0 1 1 0 1];
%     switchModelOneSwitchArray5 = [0 0 0 0 1 0 1 1 0 1 1 0];
%     switchModelOneSwitchArray6 = [0 0 0 1 0 0 1 0 0 1 1 1];
%     switchModelOneSwitchArray7 = [0 0 0 1 0 1 0 1 1 1 0 1];
%     switchModelOneSwitchArray8 = [0 0 1 0 0 0 0 1 1 1 0 0];
%     switchModelOneSwitchArray9 = [0 0 1 0 0 0 1 1 1 0 1 0];
%     switchModelOneSwitchArray10 = [0 0 1 0 1 1 0 0 1 1 1 1];
    
%     fprintf('定义数组switchModelOneSwitchArray---->完毕\n\n');
%% ---- 将三个开关组合存入一个数组中
    % ---- 定义myTestSwitchArrayArray
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                myTestSwitchArrayArray(1, :)代表allSwitchOnSwitchArray
                myTestSwitchArrayArray(2, :)代表allSwitchOffSwitchArray
                myTestSwitchArrayArray(3, :)代表switchModelOneSwitchArray
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        myTestSwitchArrayArray = [allSwitchOnSwitchArray; allSwitchOffSwitchArray; ...
            switchModelOneSwitchArray];
%             switchModelOneSwitchArray1; switchModelOneSwitchArray2; ...
%             switchModelOneSwitchArray3; switchModelOneSwitchArray4; switchModelOneSwitchArray5; ...
%             switchModelOneSwitchArray6; switchModelOneSwitchArray7; switchModelOneSwitchArray8; ...
%             switchModelOneSwitchArray9; switchModelOneSwitchArray10];
        
        % ---- 得到行数和列数，其中m代表行数，n代表列数
        [m, n] = size(myTestSwitchArrayArray);
    
    %{
        % ---- 测试
            [m, n] = size(myTestSwitchArrayArray);
            disp(m)
            disp(n)
            for ii = 1:1:m
                fprintf('当前的开关组合：');
                fprintf('%.0f ', myTestSwitchArrayArray(ii, :));
                fprintf('\n');
            end
    %}