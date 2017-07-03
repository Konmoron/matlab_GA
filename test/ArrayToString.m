%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本函数用于测试将数组转换成字符串 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% ---- 定义数组
    % ---- 开关组合信息：1 1 0 1 0 0 0 1 1 1 1 0 3.85 -11.82 3359
    SwitchArray = [1 1 0 1 0 0 0 1 1 1 1 0 3.85 -11.82 3359];
%% ---- 将数组转换成字符串
    SwitchArrayString = num2str(SwitchArray(15));
%% ---- 输出SwitchArrayString
    disp(SwitchArrayString);
%% ---- 字符串的拼接
    contactString = ['contact', num2str(SwitchArray(15)), '.mat'];
    disp(contactString);