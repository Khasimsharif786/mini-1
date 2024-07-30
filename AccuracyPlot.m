clc;
close all;
plot(info1.TrainingAccuracy)
hold on;
plot(info1.ValidationAccuracy)
xlabel("Iterations")
ylabel("Accuracy")
legend("Training Accuracy","Validation Accuracy")
title("MyNet Accuracy Trained with SGDM")
figure(2)
plot(info2.TrainingAccuracy)
hold on;
plot(info2.ValidationAccuracy)
xlabel("Iterations")
ylabel("Accuracy")
legend("Training Accuracy","Validation Accuracy")
title("AlexNet Accuracy Trained with SGDM")