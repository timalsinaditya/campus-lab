x = [2, 5; 4, 6];
y = [1, 5; 6, -2];

%(a) Find the sum of X and Y
sum_matrix = x+y;
disp(['The sum of X and Y is : ']);
disp(sum_matrix);

%(b) Find the difference between X and Y
difference_matrix = x-y;
disp(['The difference between x and y is : ']);
disp(difference_matrix);

%(c) Find the product between X and Y
product_matrix = x*y;
disp(['The product between x and y is : ']);
disp(product_matrix);

%(d) Calculate the transpose of X
transpose_matrix = x';
disp(['The transpose of x is : ']);
disp(transpose_matrix);

%(e) Calculate the inverse of X
if det(x) ~= 0
    inverse_matrix = inv(x);
    disp(['The inverse of x is : ']);
    disp(inverse_matrix);
else
    disp('The matrix is singular.');
end

%(f) Perform an element by element multiplication between X and Y
elem_mul = zeros(2,2);
for i = 1:2
    for j = 1:2
        elem_mul(i, j) = x(i, j) * y(i, j);
    end
end

disp('Element-wise multiplication result:');
disp(elem_mul);

%(g) Perform an element by element division between X and Y
elem_div = zeros(2,2);

for i=1:2
    for j=1:2
        elem_div(i,j)= x(i,j)/y(i,j);
    end
end

disp('Here is the output of element wise division: ');
disp(elem_div);
%(h) Square each element of X.
squared_elements = zeros(2,2);

for i=1:2
    for j=1:2
        squared_elements(i,j) = x(i,j)*x(i,j)
    end 
end

disp('Here is the result of the square of each digit: ');
disp(squared_elements);
%(i) Raise each element in X to the power by its corresponding element in Y.

result = x.^ x; % Raises each element of A to the power of itself

disp('Result of raising each element to its own power:');
disp(result);
