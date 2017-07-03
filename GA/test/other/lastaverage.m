function lastaverage
persistent a
choice = 'y';
while strcmpi(choice(1),'y')
    b=input('请输入数字：');
    a=[b a];
    if length(a)<25
        disp(['最近25个数字的平均数：' num2str(mean(a)) ])
    else
        disp(['最近25个数字的平均数：' mean(a(1:25)) ])
    end
    choice = input('\n是否继续？是(Y)/否(N)','s');
end