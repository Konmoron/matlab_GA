options = gaoptimset('Generations',300,'Display','none');
rng('default')
record = [];
for n = 0:.05:1
    options = gaoptimset(options,'CrossoverFraction',n);
    [x,fval] = ga(@rastriginsfcn,2,[],[],[],[],[],[],[],options);
    record = [record;fval];
end 
plot(0:.05:1,record);
xlabel('Crossover Fraction');
ylabel('fval')