function [  num_g, N_tata,N_caat ]=my_feature(x)
 Bases = basecount(x,'Ambiguous','ignore');
% num_t=Bases.T/(Bases.A+Bases.T+Bases.C+Bases.G);
num_g=Bases.G/(Bases.A+Bases.T+Bases.C+Bases.G);
 % num_c=Bases.C/(Bases.A+Bases.T+Bases.C+Bases.G);
%num_a=Bases.A/(Bases.A+Bases.T+Bases.C+Bases.G);
% % % %  w=(num_a+num_g)-(num_c+num_t);
% % % %  y=(num_a+num_c)-(num_g+num_t);
% % % %  z=(num_a+num_t)-(num_c+num_g);
   N_tata=seqwordcount(x,'TATA')>=1;
  N_caat=seqwordcount(x,'CCAAT')>=1;
% % % % % % % % %%%s=my_DNA_calculating(x);
% % % % N_TTGACA=seqwordcount(x(14:18),'TTGAC');
% % % % % % % %  s=my_feature3(x);
% % % % %aaa=N_tata*N_TTGACA;