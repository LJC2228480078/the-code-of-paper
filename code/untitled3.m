x1 = linspace(2.2, 6, 1000);
y1 = fuzzynumberplot(x1, 2.2, 4, 4, 6, 0.9);
y2 = fuzzynumberplot(x1, 2.2, 4, 4, 6, 1);
x3 = linspace(1, 5, 1000);
y3 = fuzzynumberplot(x3, 1, 4, 4, 5, 0.8);
x4 = linspace(3, 7, 1000);
y4 = fuzzynumberplot(x4, 3, 4, 4, 7, 0.8);
x5=linspace(3,8,1000);
y5=fuzzynumberplot(x5,3,5,6,8,1);
x6=linspace(3,8,1000);
y6=fuzzynumberplot(x6,3,5,6,8,0.8);
x7=linspace(3,9,1000);
y7=fuzzynumberplot(x7,3,5,6,9,1);
x8=linspace(3,9,1000);
y8=fuzzynumberplot(x8,3,5,6,9,0.8);
x9=linspace(-4,4,1000);
y9=fuzzynumberplot(x9,-4,0,0,4,1);
x10=linspace(-2,2,1000);
y10=fuzzynumberplot(x10,-2,0,0,2,1);
x11=linspace(0,1.9,1000);
y11=fuzzynumberplot(x11,0,1,1,1.9,1);
x12=linspace(0,2.9,1000);
y12=fuzzynumberplot(x12,0,2,2,2.9,1);
x13=linspace(2,7,1000);
y13=fuzzynumberplot(x13,2,17/4,17/4,7,1);
x14=linspace(3,7,1000);
y14=fuzzynumberplot(x14,3,4,4,7,1);
x15=linspace(2,7,1000);
y15=fuzzynumberplot(x15,2,3,5,7,1);
x16=linspace(1,7,1000);
y16=fuzzynumberplot(x16,1,4,4.5,7,1);

figure(1)
plot(x1, y1, 'LineWidth', 2.2, 'DisplayName', '$\tilde{B}_1$');
hold on
plot(x1, y2, 'LineWidth', 2.2, 'DisplayName', '$\tilde{B}_1$');
plot(x3, y3, 'LineWidth', 2.2, 'DisplayName', '$\tilde{B}_1$');
plot(x4, y4, 'LineWidth', 2.2, 'DisplayName', '$\tilde{B}_1$');
xlim([0.5, 7.5])
ylim([0, 1.05])
xlabel("x")
ylabel("u_B(x)")
set(gca, 'LineWidth', 1.5)
legend('Location', 'northwest', 'Interpreter', 'latex');

figure(2)
plot(x5, y5, 'LineWidth', 2.2, 'DisplayName', '$\tilde{C}_1$');
hold on
plot(x6, y6, 'LineWidth', 2.2, 'DisplayName', '$\tilde{C}_2$');
plot(x7, y7, 'LineWidth', 2.2, 'DisplayName', '$\tilde{C}_3$');
plot(x8, y8, 'LineWidth', 2.2, 'DisplayName', '$\tilde{C}_4$');
xlim([2.5, 9.5])
ylim([0, 1.05])
xlabel("x")
ylabel("u_C(x)")
set(gca, 'LineWidth', 1.5)
legend('Location', 'northwest', 'Interpreter', 'latex');


figure(3)
plot(x9, y9, 'LineWidth', 2.2, 'DisplayName', '$\tilde{D}_1$');
hold on
plot(x10, y10, 'LineWidth', 2.2, 'DisplayName', '$\tilde{D}_2$');
plot(x11, y11, 'LineWidth', 2.2, 'DisplayName', '$\tilde{D}_3$');
plot(x12, y12, 'LineWidth', 2.2, 'DisplayName', '$\tilde{D}_4$');
xlim([-4.5, 4.5])
ylim([0, 1.05])
xlabel("x")
ylabel("u_D(x)")
set(gca, 'LineWidth', 1.5)
legend('Location', 'northwest', 'Interpreter', 'latex');


figure(4)
plot(x14, y14, 'LineWidth', 2.2, 'DisplayName', '$\tilde{A}_1$');
hold on
plot(x13, y13, 'LineWidth', 2.2, 'DisplayName', '$\tilde{A}_2$');
plot(x15, y15, 'LineWidth', 2.2, 'DisplayName', '$\tilde{A}_3$');
plot(x16, y16, 'LineWidth', 2.2, 'DisplayName', '$\tilde{A}_1$');
xlim([0.5, 7.5])
ylim([0, 1.05])
xlabel("x")
ylabel("u_A(x)")
set(gca, 'LineWidth', 1.5)
legend('Location', 'northwest', 'Interpreter', 'latex');


