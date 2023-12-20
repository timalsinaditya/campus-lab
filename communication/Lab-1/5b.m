
x = [2, 5; 4, 6];
y = [1, 5; 6, -2];
z = zeros(2, 2); 

m = 1;
while m <= 2
    n = 1;
    while n <= 2
        z(m, n) = x(m, n) + y(m, n);
        n = n + 1;
    endwhile
    m = m + 1;
endwhile

disp('Resultant matrix z after addition:');
disp(z);
