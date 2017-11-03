function Question5(~)

	n = 1;
	relative_error = 0;
	fprintf('Part1: \n');
    fprintf('\tn\trelative_error\n');
    warning('off');

    while (relative_error < 1)
		n = n+1;
        [x_hat, relative_error] = hat_error(n); %relative error and absolute error are the same.       
		fprintf('\t%d\t%e\n', n, relative_error);
    end
    
    fprintf('\nPart2: \n');
    fprintf('\tn\tcond(H)\t\tlog(cond(H))\n');
    
    n_2 = (2:13)';
    cond_H = zeros(12,1);
    log_cond_H = zeros(12,1);
    correct = zeros(12,1);
    
    for i = 2:13
        cond_H(i-1) = cond(hilb(i), Inf);
        log_cond_H(i-1) = log(cond_H(i-1));
        fprintf('\t%d\t%e\t%f\n', i, cond_H(i-1), log_cond_H(i-1));        
    end
    
    plot(n_2, log_cond_H);
        
    slope_intersect = [ones(12,1), n_2] \ log_cond_H;
    
    fprintf('By Linear Regression we can write log(cond(H)) = %fn%f\n', slope_intersect(2), slope_intersect(1));
    
    fprintf('\nPart3: \n');
    fprintf('\tn\tnorm(x_hat)\tcorrect digits\tcond(H)\n');
    
    for i = 2:13
        [x_hat, relative_error] = hat_error(i);
        x_hat_norm = norm(x_hat, Inf);
        correct(i-1) = 0-floor(log10(relative_error));
        fprintf('\t%d\t%e\t%d\t\t%e\n', i, x_hat_norm, correct(i-1), cond_H(i-1));
    end
end

function [x_hat,err] = hat_error(n)
    H = hilb(n);
	x = ones(n, 1);
	b = H*x;
	x_hat = H\b;
	err = norm(x_hat-x, Inf);
end

