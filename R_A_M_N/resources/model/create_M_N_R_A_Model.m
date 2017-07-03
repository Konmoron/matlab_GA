%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于创建m行n列的可重构天线的模型 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 说明 ---- %
        % ----
        % ---- 本脚本用于创建m行n列的可重构天线的模型
        % ----
        
    % ---- 注意 ---- %
        % ----
        % ---- 此脚本只是用于生成m行n列的可重构天线模型，需要配合其他的程序
        % ---- 需要在其他程序中调用此脚本
        % ---- 
        % ----
        % ---- 此脚本需要开关组合数组tmpSwtichArray来判断是否创建每个开关，索引为0代表不创建开关，所以为1代表创建开关
        % ----

%% ---- 声明全局变量
    global patchLength maxWavelength... % ---- 基本参数
           portDiameter inputDiameter portX portY... % ---- 馈点参数
           height substrateLength_X substrateLength_Y... % ---- 基板参数
           patchCoordinateArr_X patchCoordinateArr_Y ... % ---- 贴片参数
           switchLength switchWidth switchCoordinateArr_X_Row switchCoordinateArr_Y_Row switchCoordinateArr_X_Col switchCoordinateArr_Y_Col numOfSwitch... % ---- 开关参数
           m n; % ---- 可重构天线的行数和列数
%% ---- 创建空气盒子（Box）
    hfssBox(fid, 'AirBox', [-(substrateLength_X/2 + maxWavelength), ...
        -(substrateLength_Y/2 + maxWavelength), -10], ...
        [2 * (substrateLength_X/2 + maxWavelength), ...
        2 * (substrateLength_Y/2 + maxWavelength), ...
        height + maxWavelength + 10], 'mm');
    % ---- Assign Radiation
    hfssAssignRadiation(fid, 'AirBoxRadiation', 'AirBox');
    % ---- set Transparency
    hfssSetTransparency(fid, {'AirBox'}, 0.95);
%% ---- 创建基板（Substrate）
    hfssBox(fid, 'Substrate', [-substrateLength_X/2, -substrateLength_Y/2, 0], ...
        [substrateLength_X, substrateLength_Y, height], 'mm');
    % ---- 设置材料
    hfssAssignMaterial(fid, 'Substrate', 'Rogers RT/duroid 5880 (tm)');
    % ---- 设置Color
    hfssSetColor(fid, 'Substrate', [132, 132, 193]);
    % ---- 设置透明度
    hfssSetTransparency(fid, {'Substrate'}, 0.8);
%% ---- 创建馈线（Feed）
    hfssCylinder(fid, 'Feed', 'Z', [portX, portY, 0], portDiameter/2, height, 'mm');
    % ---- 设置材料
    hfssAssignMaterial(fid, 'Feed', 'pec');
    % ---- 设置solve inside
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                因为馈线是良导体，内部不需要计算，所以设置solve inside为false
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
    hfssSetSolveInside(fid, 'Feed', false);
%% ---- 创建地平面（GND）
    for ii = 1:1:1  % ---- 此处for循环只执行一次循环体，存在的意义是：为了折叠程序
        hfssRectangle(fid, 'GroundPlane', 'Z', [-substrateLength_X/2, -substrateLength_Y/2, 0], ...
            substrateLength_X, substrateLength_Y, 'mm');
        % ---- assign PE boundary
            hfssAssignPE(fid, 'GND', {'GroundPlane'});

        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                hfssSubtract提供的Subtract没有Clone选项，因此执行操作之后，toolParts会被删除
                因此，需要先画地平面，使用hfssSubtract，在地平面上留出Port平面
                随后再创建馈电口（Port）
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}

        % ---- 在GroundPlane上为Port预留空间
            % ---- 创建tempPort
                hfssCircle(fid, 'tempPort', 'Z', [portX, portY, 0], inputDiameter/2, 'mm');
            % ---- 使用hfssSubtract，在GroundPlane上去除tempPort部分，为Port留出空间
                hfssSubtract(fid, {'GroundPlane'}, {'tempPort'});
    end
%% ---- 创建馈电口（Port）
    hfssCircle(fid, 'Port', 'Z', [portX, portY, 0], inputDiameter/2, 'mm');
    % ---- Assign Lumped Port
    hfssAssignLumpedPort(fid, 'LumpedPort', 'Port', [portX + portDiameter/2, portY, 0], ...
        [portX + inputDiameter /2, portY, 0], 'mm');
%% ---- 创建贴片阵列（Patch Array）
    for ii = 1:1:m % ii控制列数
        for jj = 1:1:n % jj控制行数
            % ---- 得到当前贴片的名字
                %{
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        1.首先将ii和jj转为字符
                        2.通过字符串的拼接，得到当前贴片的名字
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                patchName = ['Patch' num2str(ii) num2str(jj)];
            % ---- 建立贴片
                hfssRectangle(fid, patchName, 'Z', [patchCoordinateArr_X(ii), ...
                    patchCoordinateArr_Y(jj), height], patchLength, patchLength, 'mm');
            % ---- assign PE boundary
                hfssAssignPE(fid, patchName, {patchName});
            % ---- set Color
                hfssSetColor(fid, patchName, [255, 255, 0]);
            % ---- set Transparency
                hfssSetTransparency(fid, {patchName}, 0);
        end
    end
%% ---- 创建开关阵列
    % ---- 创建列开关
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                列开关就是位于列与列之间的开关，个数为：(n -1) * m
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        % ---- 定义列开关计数变量
            countCol = 1;
        % ---- 循环创建列开关
            %{
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    创建的过程中是先沿X方向，再沿Y方向建立开关模型
                        这样创建的目的是为了方便命名
                        最终得到的是沿X方向按顺序命令
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            for ii = 1:1:m % ---- X方向的坐标
                for jj = 1:1:n-1 % ---- Y方向的坐标
                    % ---- 判断当前开关是否存在
                        if tmpSwtichArray(countCol) == 1
                            % ---- 得到当前开关的名字
                                switchName = ['Switch' num2str(countCol)];
                            % ---- 创建开关
                                hfssRectangle(fid, switchName, 'Z', [switchCoordinateArr_X_Col(ii), ...
                                    switchCoordinateArr_Y_Col(jj), height], switchWidth, switchLength, 'mm');
                            % ---- assign PE boundary
                                hfssAssignPE(fid, switchName, {switchName});
                            % ---- set Color
                                hfssSetColor(fid, switchName, [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                            % ---- set Transparency
                                hfssSetTransparency(fid, {switchName}, 0);
                        end
                    % ---- 计数变量增加1
                        %{
                            ---- 注意 ----
                            ---- 注意 ----
                            ---- 注意 ----
                                为了得到下一个X方向的列开关的名字，countCol需要+1
                            ---- 注意 ----
                            ---- 注意 ----
                            ---- 注意 ----
                        %}
                        countCol = countCol + 1;
                end
                % ---- 计数变量增加n
                    %{
                        ---- 注意 ----
                        ---- 注意 ----
                        ---- 注意 ----
                            为了得到下一行第一个X方向的列开关的名字，countCol需要增加n
                                这样的目的是保证了开关的命名的连续性
                        ---- 注意 ----
                        ---- 注意 ----
                        ---- 注意 ----
                    %}
                    countCol = countCol + n;
            end
    % ---- 创建行开关
        %{
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                行开关就是位于行与行之间的开关，个数为：(m -1) * n
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        % ---- 定义列开关计数变量
            %{
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    之所以从n开始，是为了和第一行的开关命名连续
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            countRow = n;
        % ---- 循环创建行开关
            %{
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    创建的过程中是先沿X方向，再沿Y方向建立开关模型
                        这样创建的目的是为了方便命名
                        最终得到的是沿X方向按顺序命令
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            for ii = 1:1:m-1 % ---- X方向的坐标
                for jj = 1:1:n % ---- Y方向的坐标
                    % ---- 判断当前当前开关是否存在
                        if tmpSwtichArray(countRow) == 1
                            % ---- 得到当前贴片的名字
                                switchName = ['Switch' num2str(countRow)];
                            % ---- 创建开关
                                hfssRectangle(fid, switchName, 'Z', [switchCoordinateArr_X_Row(ii), ...
                                    switchCoordinateArr_Y_Row(jj), height], switchLength, switchWidth, 'mm');
                            % ---- assign PE boundary
                                hfssAssignPE(fid, switchName, {switchName});
                            % ---- set Color
                                hfssSetColor(fid, switchName, [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                            % ---- set Transparency
                                hfssSetTransparency(fid, {switchName}, 0);
                        end
                    % ---- 计数变量增加1
                        %{
                            ---- 注意 ----
                            ---- 注意 ----
                            ---- 注意 ----
                                为了得到下一个X方向的列开关的名字，countCol需要+1
                            ---- 注意 ----
                            ---- 注意 ----
                            ---- 注意 ----
                        %}
                        countRow = countRow + 1;
                end
                % ---- 计数变量增加n - 1
                    %{
                        ---- 注意 ----
                        ---- 注意 ----
                        ---- 注意 ----
                            为了得到下一行第一个X方向的列开关的名字，countCol需要增加n - 1
                                这样的目的是保证了开关的命名的连续性
                        ---- 注意 ----
                        ---- 注意 ----
                        ---- 注意 ----
                    %}
                    countRow = countRow + n - 1;
            end
%% ---- 将贴片和开关合并
    % ---- 得到numOfPatch
        numOfPatch = m * n;
    % ---- 得到numOfPatch_Switch
        numOfPatch_Switch = numOfPatch + numOfSwitch;
    % ---- 创建一个cell元包Patch_Switch
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                Patch_Switch元包用于储存所有的贴片和开关
                hfssUnite调用Patch_Switch元包，将Patch_Switch元包内的所有元素合并
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        Patch_Switch = cell(1, numOfPatch_Switch);
    % ---- 定义Patch_Switch的计数变量index_Patch_Switch
        index_Patch_Switch = 1;
    % ---- 将所有的贴片存入Patch_Switch元包
        for ii = 1:1:m % ---- 控制行数
            for jj = 1:1:n % ---- 控制列数
                % ---- 将当前贴片存入Patch_Switch元包
                    Patch_Switch{index_Patch_Switch} = ['Patch' num2str(ii) num2str(jj)];
                % ---- 计数变量index_Patch_Switch＋1
                    index_Patch_Switch = index_Patch_Switch + 1;
            end
        end
    % ---- 将所有的开关存入Patch_Switch元包
        for ii = 1:1:numOfSwitch
            % ---- 将当前开关存入Patch_Switch元包
                Patch_Switch{index_Patch_Switch} = ['Switch' num2str(ii)];
            % ---- 计数变量index_Patch_Switch＋1
                index_Patch_Switch = index_Patch_Switch + 1;
        end
    % ---- 调用函数hfssUnite，合并所有的贴片和开关
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                hfssUnite这个函数有一个特性：
                    它会将相连的合并，如果没有相连，就不合并，
                    而且，如果Object不存在，则跳过
                    简直就是神一般的函数啊
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        hfssUnite(fid, Patch_Switch);