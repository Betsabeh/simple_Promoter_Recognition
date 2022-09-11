function draw_ghraf()
close all
a=textread('train.text','%s', 'delimiter', '\n','whitespace', '');
% % % num_t=0;
% % % num_c=0;
% % % num_g=0;
% % % num_a=0;
freq1=zeros(59,4);
freq2=zeros(59,4);
for i=1:80
    x=cell2mat(a(i)); % while the first char is label , we separate this label
    x=strtrim(x);
    index=findstr(x,',');%each row contains dna sequence, which is include label(+,-), name , and dna sequence these are separate with coma 
    x=x(index(2)+1:end);
% % %     Bases = basecount(x,'Ambiguous','ignore');
% % %     num_t=Bases.T+num_t;
% % %     num_a=Bases.A+num_a;
% % %     num_c=Bases.C+num_c;
% % %     num_g=Bases.G+num_g;

    [n,m]=size(x);
if (i>40)
for j=1:m
    switch (x(j))
        case 'a'
          freq2(j,1)=freq2(j,1)+1;
       case 't'
          freq2(j,2)=freq2(j,1)+1;
       case 'c'
          freq2(j,3)=freq2(j,3)+1;
       case 'g'
          freq2(j,4)=freq2(j,4)+1;
    end
end
else
    for j=1:m
    switch (x(j))
        case 'a'
          freq1(j,1)=freq1(j,1)+1;
       case 't'
          freq1(j,2)=freq1(j,1)+1;
       case 'c'
          freq1(j,3)=freq1(j,3)+1;
       case 'g'
          freq1(j,4)=freq1(j,4)+1;
    end
    end
end
end
   figure
  pie([sum(freq1(:,1)), sum(freq1(:,2)),sum(freq1(:,3)),sum(freq1(:,4))],{'a ','t','c','g'})
   figure
    pie([sum(freq2(:,1)), sum(freq2(:,2)),sum(freq2(:,3)),sum(freq2(:,4))],{'a ','t','c','g'})