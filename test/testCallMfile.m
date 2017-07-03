% ==== 测试调用另一个m文件的参数 ====

% ---- clear and close
clear all;
close all;

% ---- 加载参数文件
allKnownParameters;

% ---- 调用参数
disp('输出格式1');
disp('这是来自另一个文件的参数');
disp('switchLength = ');
disp(switchLength);

% ---- 输出格式2
disp('输出格式2');
disp(sprintf('switchLength = %8.5f\n', switchLength));

% ---- 输出格式3
fprintf('输出格式3\n');  % ---- \n = 换行
fprintf('switchLength = %8.5f\n', switchLength);