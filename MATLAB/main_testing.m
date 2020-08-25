function cost = main_testing(inputs,num_of_disc,plot_flag)

    k1           = 1; % N/(m/s)^2.
    k2           = 20; % N/A.
%     num_of_disc  = 20;
%     inputs       = zeros(num_of_disc,1);
    m            = 1; % kg.
    g            = 9.8; % m/s^2.
    max_position = 1; % m.
    time         = 10; % seconds.
    time_disc    = 1000;
    t            = linspace(0,1,time_disc);
    dt           = t(2);
    v            = zeros(time_disc,1);
    z            = zeros(time_disc,1);

    ft = @(i) k2*i;
    fd = @(v) k1*v^2;
    fg = m*g;

    inter_control = interp1(linspace(0,1,num_of_disc),inputs,linspace(0,1,1000));

    for i = 1:time_disc-1

        current = inter_control(i);
        v(i+1)  = v(i) + dt*time*(ft(current)-sign(v(i))*fd(v(i))-fg)/m;
        z(i+1)  = z(i) + dt*time*v(i);

    end

    cost = sum(abs(z-1/2).^2);
    
    if plot_flag
       
        plot(z);
        figure;
        plot(v);
        figure;
        plot(inter_control);
        
    end

end