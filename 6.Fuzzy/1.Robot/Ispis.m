subplot(221)
clock=out.tout;

subplot(231); 
plot(clock, out.q1,'b',clock, out.qr1,'r');
xlabel('vrijeme'); ylabel('pozicija 1');
legend('odziv','referentni signal');

subplot(232); 
plot(clock, out.q2, 'b', clock, out.qr2, 'r');
xlabel('vrijeme'); ylabel('pozicija 2');
legend('odziv','referentni signal');

subplot(233); 
plot(clock, out.dq1, 'b'); 
xlabel('vrijeme'); ylabel('brzina 1');

subplot(234); 
plot(clock, out.dq2, 'b'); 
xlabel('vrijeme'); ylabel('brzina 2');

subplot(235); 
plot(clock, out.U1, 'b'); 
xlabel('vrijeme'); ylabel('moment 1');

subplot(236); 
plot(clock, out.U2, 'b'); 
xlabel('vrijeme'); ylabel('sila 2');
% (-2*m2*u(3)*u(2)*u(4)-m1*lc1*g*cos(u(1))-m2*g*u(3)*cos(u(1))+u(5))/(m0+m2*u(3)*u(3))

% u(3)*u(2)*u(2)-g*sin(u(1))+u(4)/m2
