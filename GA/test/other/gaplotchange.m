function state = gaplotchange(options,state,flag)
persistent last_best
if (strcmp(flag,'init'))
    set(gca,'xlim',[1,options.Generations],'Yscale','log');
    hold on;
    xlabel Generation
    title('Change in Best Fitness Value')
end
best = min(state.Score);
if state.Generation == 0
    last_best = best;
else
    change = last_best - best;
    last_best = best;
    plot(state.Generation, change,'.r');
    title('Change in Best Fitness Value')
end