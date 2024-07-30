function layers=newnet(x)
layers = [
    imageInputLayer([227 227 3],"Name","imageinput")
    convolution2dLayer([11 11],96,"Name","conv_1","Stride",[4 4])
    reluLayer("Name","relu_1")
    maxPooling2dLayer([3 3],"Name","maxpool_1","Stride",[2 2])
    convolution2dLayer([5 5],256,"Name","conv_2","Padding",[2 2 2 2])
    reluLayer("Name","relu_2")
    maxPooling2dLayer([3 3],"Name","maxpool_2","Stride",[2 2])
    convolution2dLayer([3 3],384,"Name","conv_3","Padding",[1 1 1 1])
    reluLayer("Name","relu_3")
    convolution2dLayer([3 3],384,"Name","conv_4","Padding",[1 1 1 1])
    reluLayer("Name","relu_4")
    convolution2dLayer([3 3],384,"Name","conv_5","Padding",[1 1 1 1])
    reluLayer("Name","relu_5")
    fullyConnectedLayer(x,"Name","fc")
    softmaxLayer("Name","softmax")
    classificationLayer("Name","classoutput")];
plot(layerGraph(layers));
end