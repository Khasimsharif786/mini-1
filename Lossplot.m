clc;
close all;
plot(info1.TrainingLoss)
hold on;
plot(info1.ValidationLoss)
xlabel("Iterations")
ylabel("Loss")
legend("Training Loss","Validation Loss")
title("MyNet Loss Trained with ADAM")
figure(2)
plot(info2.TrainingLoss)
hold on;
plot(info2.ValidationLoss)
xlabel("Iterations")
ylabel("Loss")
legend("Training Loss","Validation Loss")
title("AlexNet Loss Trained with ADAM")