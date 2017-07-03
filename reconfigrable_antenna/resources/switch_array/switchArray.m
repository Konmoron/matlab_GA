%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于产生一个临时的数组testSwtichArray，用于测试模型的建立 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 注释 ---- %
        % ---- 本脚本只是用于产生一个数组testSwtichArray
        % ---- 这个数组testSwtichArray只有0和1两个元素
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
            
            
        % ---- 例如：testSwtichArray = [0 1 0 1 0 1 0 1 0 1 0 1]
            % ---- 代表：
                % ---- Switch11开关断开
                % ---- Switch12开关闭合

                % ---- Switch21开关断开
                % ---- Switch22开关闭合
                % ---- Switch23开关断开

                % ---- Switch31开关闭合
                % ---- Switch32开关断开

                % ---- Switch41开关闭合
                % ---- Switch42开关断开
                % ---- Switch43开关闭合

                % ---- Switch51开关断开
                % ---- Switch52开关闭合
            
%% ---- 创建数组testSwtichArray
    % ---- 定义开关Switch11
        switch11 = 0;
    % ---- 定义开关switch12
        switch12 = 0;
    % ---- 定义开关switch21
        switch21 = 0;
    % ---- 定义开关switch22
        switch22 = 0;
    % ---- 定义开关switch23
        switch23 = 1;
    % ---- 定义开关switch31
        switch31 = 0;
    % ---- 定义开关switch32
        switch32 = 1;
    % ---- 定义开关switch41
        switch41 = 1;
    % ---- 定义开关switch42
        switch42 = 1;
    % ---- 定义开关switch43
        switch43 = 1;
    % ---- 定义开关switch51
        switch51 = 0;
    % ---- 定义开关switch52
        switch52 = 0;
        
    % ---- 将所有开关变量添加到testSwtichArray数组
        testSwtichArray = [switch11, switch12, switch21, switch22, switch23, switch31, ...
            switch32, switch41, switch42, switch43, switch51, switch52];