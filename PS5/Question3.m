%% PS5 Q3 : finding truncation error

true_value = exp(2);
orders = 0:5;
approximations = zeros(size(orders));
percent_errors = zeros(size(orders));

for i = 1:length(orders)
    n = orders(i);
    approximation = 0;
    x = 2;
    for j = 0:n
        approximation = approximation + (x^j) / factorial(j);
    end
    error = true_value - approximation;
    percent_error = abs(error / true_value) * 100;
    approximations(i) = approximation;
    percent_errors(i) = percent_error;
    fprintf('Order %d Approximation: %f, Percent Relative Error: %f%%\n', n, approximation, percent_error);
end
