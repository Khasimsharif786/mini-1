% Define input size and number of classes
inputSize = [1, size(3, 2)]; % Assuming grayscale images with one channel
numClasses = 6;

% Define the layers
layers = [
    imageInputLayer(inputSize, 'Name', 'input_image') % Image input layer
    convolution1dLayer(3, 82, 'Padding', 'causal', 'Name', 'conv1d')
    lstmLayer(25, 'OutputMode', 'sequence', 'Name', 'lstm')
    globalAveragePooling1dLayer('Name', 'global_avg_pooling')
    fullyConnectedLayer(numClasses, 'Name', 'fc')
    softmaxLayer('Name', 'softmax')
    classificationLayer('Name', 'output')
];

% Define the network
net = [
    layers
];

% Specify training options
options = trainingOptions('adam', ...
    'MaxEpochs', 1000, ...
    'MiniBatchSize', 30, ...
    'ValidationData', {X_test, categorical(y_test)}, ...
    'ValidationFrequency', 30, ...
    'ValidationPatience', 100, ...
    'Plots', 'training-progress', ...
    'Verbose', 1, ...
    'ExecutionEnvironment', 'auto', ...
    'CheckpointPath', 'test_checkpoint'); % Specify checkpoint path

% Train the network
net = trainNetwork(X_train, categorical(y_train), net, options);
