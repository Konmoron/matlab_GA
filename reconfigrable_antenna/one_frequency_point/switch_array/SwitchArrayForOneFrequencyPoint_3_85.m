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
    % ---- 开关组合信息：0 1 1 0 0 1 1 1 0 1 0 1 3.85 -22.77 1654
    SwitchArray1 = [0 1 1 0 0 1 1 1 0 1 0 1 3.85 -22.77 1654];
%% ---- 创建开关组合2：SwitchArray2
    % ---- 开关组合信息：1 1 1 1 0 0 0 1 1 1 1 0 3.85 -21.24 3871
    SwitchArray2 = [1 1 1 1 0 0 0 1 1 1 1 0 3.85 -21.24 3871];
%% ---- 创建开关组合3：SwitchArray3
    % ---- 开关组合信息：1 1 1 1 0 0 0 1 1 0 1 0 3.85 -20.04 3867
    SwitchArray3 = [1 1 1 1 0 0 0 1 1 0 1 0 3.85 -20.04 3867];
%% ---- 创建开关组合4：SwitchArray4
    % ---- 开关组合信息：1 1 0 1 0 0 0 1 1 1 1 0 3.85 -11.82 3359
    SwitchArray4 = [1 1 0 1 0 0 0 1 1 1 1 0 3.85 -11.82 3359];
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