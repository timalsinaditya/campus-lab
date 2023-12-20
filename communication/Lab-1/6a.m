function result = f(k)
    result = exp(0.05 * k);
end

%intialize the array of the 30 elements which is row vector

row_vector = zeros(1, 30);

for k=1:30
    row_vector(k)=f(k);
end

%a) Calculate the maximum value in (f)
disp(['The maximum element is: ', num2str(row_vector(30))]);

%b) Calculate the minimum value in (f)
disp(['The mimimum element is: ', num2str(row_vector(1))]);

%c) Sum all the entries in (f)
sum =0;
for k=1:30
    sum+=row_vector(k);
end
disp(['The sum of all elements is: ', num2str(sum)]);

%d) Find the product of all the entries in (f)
mul =1;
k =1;
while k <=30;
    mul *= row_vector(k);
    k+=1;
endwhile
disp(['The product of all the entries is: ' num2str(mul)]);

%e) Find the mean of all the entries in (f)
disp(['The mean of all the entries is: ', num2str(sum/length(row_vector))]);

%f) Find the variance of all the entries in (f)
disp(['The variance of all the entries is: ', num2str(var(row_vector))]);

%g) Find the dimension of (f)
disp(['The dimension of the vector is : ', num2str(size(row_vector))]);

%h) Find the length of (f)
disp(['The length of the row vector is: ', num2str(length(row_vector))]);

%disp(row_vector);

