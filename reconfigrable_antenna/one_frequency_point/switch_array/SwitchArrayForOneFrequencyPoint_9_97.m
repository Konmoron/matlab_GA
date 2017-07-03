%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于储存单个频点对应的所有开关组合数组 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本只是用于产生一个数组SwitchArrayOfOneFrequencyPoint
        % ---- 这个数组SwitchArrayOfOneFrequencyPoint只有0和1两个元素
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
            
            
%% ---- 创建开关组合1：SwitchArray1
    % ---- 开关组合信息：1 0 0 0 0 1 0 1 0 0 0 0 9.97 -41.58 2129
    SwitchArray1 = [1 0 0 0 0 1 0 1 0 0 0 0 9.97 -41.58 2129];
%% ---- 创建开关组合2：SwitchArray2
    % ---- 开关组合信息：0 1 0 0 1 0 0 1 0 1 1 0 9.97 -25.31 1175
    SwitchArray2 = [0 1 0 0 1 0 0 1 0 1 1 0 9.97 -25.31 1175];
%% ---- 创建开关组合3：SwitchArray3
    % ---- 开关组合信息：0 1 0 1 0 0 0 0 0 1 1 0 9.97 -18.71 1287
    SwitchArray3 = [0 1 0 1 0 0 0 0 0 1 1 0 9.97 -18.71 1287];
%% ---- 创建开关组合4：SwitchArray4
    % ---- 开关组合信息：0 1 0 1 1 0 0 0 0 1 1 0 9.97 -15.61 1415
    SwitchArray4 = [0 1 0 1 1 0 0 0 0 1 1 0 9.97 -15.61 1415];
%% ---- 将所有开关组合存入一个数组中
    % ---- 定义SwitchArrayOfOneFrequencyPoint
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                SwitchArrayOfOneFrequencyPoint(1, :)代表SwitchArray1，其他以此类推
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        SwitchArrayOfOneFrequencyPoint = [SwitchArray1; SwitchArray2; SwitchArray3; SwitchArray4];
        % ---- 得到行数和列数，其中m代表行数，n代表列数
        [m, n] = size(SwitchArrayOfOneFrequencyPoint);
% %% ---- 测试
%             [m, n] = size(SwitchArrayOfOneFrequencyPoint);
%             disp(m)
%             disp(n)
%             for ii = 1:1:m
%                 fprintf('当前的开关组合：');
%                 fprintf('%.0f ', SwitchArrayOfOneFrequencyPoint(ii, :));
%                 fprintf('\n');
%             end