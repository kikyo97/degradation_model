z2 = 0:0.01:1000;
A = zeros(1,100001)
A = besselk(0,z2)
plot(z2,A)
axis([0 5 0 8])
grid on
legend('K_0','K_1','K_2','K_3','K_4','Location','Best')
title('Modified Bessel Functions of the Second Kind for $\nu \in [0,4]$','interpreter','latex')
xlabel('z','interpreter','latex')
ylabel('$K_\nu(z)$','interpreter','latex')