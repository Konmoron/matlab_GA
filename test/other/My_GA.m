%遗传算法主程序
function My_GA
global Cmax;
Cmax=10^6;
popsize=50; %群体大小
Gene=20;
chromlength=36; %单个字符串长度（单个个体长度）
Xmax=70;
Xmin=60;
f1=2;
f2=3;
df=0.01;
pc=0.8; %交叉概率
pm=0.01; %变异概率
pop=initpop(popsize,chromlength); %随机产生初始群体
for i=1:Gene %迭代次数
    [objvalue]=calobjvalue(pop); %计算目标函数
    fitvalue=calfitvalue(objvalue) ;%计算群体中每个个体的适应度
    [newpop]=selection(pop,fitvalue); %复制
    [newpop]=crossover(newpop,pc); %交叉
    [newpop]=mutation(newpop,pm); %变异
    [bestindividual,bestfit]=best(pop,fitvalue); %求出群体中适应值最小的个体及其适应值
    Lx(i)=decodechrom(bestindividual,1,18)*(Xmax-Xmin)/(2^18-1); %最佳个体解码
    Wy(i)=decodechrom(bestindividual,19,18)*(Xmax-Xmin)/(2^18-1); %最佳个体解码
    
    s11(i)=Cmax-bestfit; %最佳个体适应度
    n(i)=i;                     %记录最优代位置
    s11_mean(i)=mean(Cmax-fitvalue); %第i代平均适应度
    pop=newpop;
end
%%绘图
%%绘图
figure(1)%最优点变化趋势图
i=1:Gene;
plot(s11(i),'-b*')
xlabel('迭代次数');
ylabel('最优个体适应值');
title('最优点变化趋势');
legend('最优点');
grid on
[z index]=min(s11); %计算最小值及其位置
% [z index]=max(y); %计算最小值及其位置 
% PO=n(index)  %最优个体的位置
figure;
f=f1:df:f2
plot(f/1e9, 20*log10(abs(S)),'b');
xlabel('Frequency(GHz)');
ylabel('S_{11} (dB)');
fprintf('画天线的S11随着Frequency变化的图形---->完毕\n\n');
X=Lx(index)  
Y=Ly(index)          
F=z



