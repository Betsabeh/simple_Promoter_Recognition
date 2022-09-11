%main file project using Neural network
clc
close all
clear all
%---------------------------read file line by line and calculate features
a=textread('train.text','%s', 'delimiter', '\n','whitespace', '');
num_feat=3;
for i=1:80
    x=cell2mat(a(i)); % while the first char is label , we separate this label
    x=strtrim(x);
    if (x(1)=='+')
        y(i)=1;
        else
        y(i)=2;
    end
    index=findstr(x,',');%each row contains dna sequence, which is include label(+,-), name , and dna sequence these are separate with coma 
for j=index(2):50
    if (x(j)=='a')||(x(j)=='t')||(x(j)=='c')||(x(j)=='g')
        break;
    end
end
x=x(j:end);

[feat(i,1),feat(i,2),feat(i,3)]=my_feature(x);
  
%feat(i,1:228)=my_feature1(x);
%feat(i,:)=my_feature2(x);

end

%-------------------------------------------test data
a=textread('test.text','%s', 'delimiter', '\n','whitespace', '');
for i=1:26
    test_data=cell2mat(a(i)); % while the first char is label , we separate this label
    test_data=strtrim(test_data);
    if (test_data(1)=='+')
        y_test(i)=1;
    else
        y_test(i)=2;
    end
    index=findstr(test_data,',');%each row contains dna sequence, which is include label(+,-), name , and dna sequence these are separate with coma 
      for j=index(2):50
    if (test_data(j)=='a')||(test_data(j)=='t')||(test_data(j)=='c')||(test_data(j)=='g')
        break;
    end
end
test_data=test_data(j:end);
  [test_feat(i,1),test_feat(i,2),test_feat(i,3)]=my_feature(test_data);
%
%test_feat(i,:)=my_feature2(test_data);

end



%**********************************************Feedforward neural network
setdemorandstream(491218382)
net = feedforwardnet(3,'trainrp');
net.trainParam.epochs=300;
%net.trainParam.goal=0.000000000000001;
%net.numInputs=4;
% % % % % % net.layers{1}.transferFcn = 'logsig';
% % % % % % net.layers{2}.transferFcn = 'logsig';
net = train(net,feat',y);
%%view(net)
%%%********************************************test
label=net(test_feat');
perf = perform(net,label,y_test)
label=round(label);
correct=0;
Tp=0;
FN=0;
for i=1:26 
    if (y_test(i)==label(i))
        correct=correct+1;
    end
    if (y_test(i)==1)&&(label(i)==1)
        Tp=Tp+1;
    end
    if (y_test(i)==2)&&(label(i)==1)
        FN=FN+1;
    end
end
correct
accuracy=correct/26
sensitivity=Tp/(Tp+FN)