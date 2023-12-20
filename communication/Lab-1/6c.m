f = [1,3,-2,(4-2i)];
g= [-3, (5+7i), 6, 2];

r1 = f+g;
disp('The sum of two vector is:');
disp(r1);

r2 = dot(f,g);
disp('The dot produc of f and g is: ');
disp(r2);

%sum of all elements
totalSum = sum(f);

disp(['The averagae is of f(k) is : ', num2str(totalSum/4)]);

%average energy

squared_f = f.^2;
totalSquaredSum = sum(squared_f);
disp(['The square of the each element is : ', num2str(totalSquaredSum/4)]);

