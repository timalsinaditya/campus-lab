x = [2, 5; 4,6];
y = [1, 5; 6, -2];
z = zeros(2,2);

for m=1:2
    for n=1:2
        z(m,n) = x(m,n) +y(m,n);
    end
end

disp(z);
