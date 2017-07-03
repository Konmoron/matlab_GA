%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于创建可重构天线的模型 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 说明 ---- %
        % ----
        % ---- 本脚本用于创建可重构天线的模型
        % ----
        
    % ---- 注意 ---- %
        % ----
        % ---- 此脚本只是用于生成可重构天线模型，需要配合其他的程序
        % ---- 需要在其他程序中调用此脚本
        % ---- 
        % ---- 此脚本产生的天线，所以的开关和贴片已经经过Unite方法合并
        % ----
        % ---- 此脚本需要开关组合数组tmpSwtichArray来判断是否创建每个开关，索引为0代表不创建开关，所以为1代表创建开关
        % ----

%% ---- 声明全局变量
    global patchLength centreDistance switchLength switchWidth portDiameter inputDiameter portX portY height substrateLength maxWavelength;
%% ---- 创建基板（Substrate）
    hfssBox(fid, 'Substrate', [-substrateLength/2, -substrateLength/2, 0], ...
        [substrateLength, substrateLength, height], 'mm');
    % ---- 设置材料
    hfssAssignMaterial(fid, 'Substrate', 'Rogers RT/duroid 5880 (tm)');
    % ---- 设置Color
    hfssSetColor(fid, 'Substrate', [132, 132, 193]);
    % ---- 设置透明度
    hfssSetTransparency(fid, {'Substrate'}, 0.6);

%         fprintf('创建基板（Substrate）---->完毕\n\n');
%% ---- 创建贴片阵列（Patch Array）
    for ii = 1:1:1  % ---- 此处for循环只执行一次循环体，存在的意义是：为了折叠程序
    % ---- 创建贴片11（Patch11）
        hfssRectangle(fid, 'Patch11', 'Z', [-(centreDistance + patchLength/2), ...
            -(centreDistance + patchLength/2), height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch11', {'Patch11'});
        % ---- set Color
        hfssSetColor(fid, 'Patch11', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch11'}, 0);       
    % ---- 创建贴片12（Patch12）
        hfssRectangle(fid, 'Patch12', 'Z', [-(centreDistance + patchLength/2), ...
            -patchLength/2, height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch12', {'Patch12'});
        % ---- set Color
        hfssSetColor(fid, 'Patch12', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch12'}, 0);
    % ---- 创建贴片13（Patch13）
        hfssRectangle(fid, 'Patch13', 'Z', [-(centreDistance + patchLength/2), ...
            centreDistance - patchLength/2, height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch13', {'Patch13'});
        % ---- set Color
        hfssSetColor(fid, 'Patch13', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch13'}, 0);


    % ---- 创建贴片21（Patch21）
        hfssRectangle(fid, 'Patch21', 'Z', [-patchLength/2, ...
            -(centreDistance + patchLength/2), height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch21', {'Patch21'});
        % ---- set Color
        hfssSetColor(fid, 'Patch21', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch21'}, 0);
    % ---- 创建贴片22（Patch22）
        hfssRectangle(fid, 'Patch22', 'Z', [-patchLength/2, -patchLength/2, ...
            height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch22', {'Patch22'});
        % ---- set Color
        hfssSetColor(fid, 'Patch22', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch22'}, 0);
    % ---- 创建贴片23（Patch23）
        hfssRectangle(fid, 'Patch23', 'Z', [-patchLength/2, ...
            centreDistance - patchLength/2, height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch23', {'Patch23'});
        % ---- set Color
        hfssSetColor(fid, 'Patch23', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch23'}, 0);


    % ---- 创建贴片31（Patch31）
        hfssRectangle(fid, 'Patch31', 'Z', [centreDistance - patchLength/2, ...
            -(centreDistance + patchLength/2), height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch31', {'Patch31'});
        % ---- set Color
        hfssSetColor(fid, 'Patch31', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch31'}, 0);
    % ---- 创建贴片32（Patch32）
        hfssRectangle(fid, 'Patch32', 'Z', [centreDistance - patchLength/2, ...
            -patchLength/2, height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch32', {'Patch32'});
        % ---- set Color
        hfssSetColor(fid, 'Patch32', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch32'}, 0);
    % ---- 创建贴片33（Patch33）
        hfssRectangle(fid, 'Patch33', 'Z', [centreDistance - patchLength/2, ...
            centreDistance - patchLength/2, height], patchLength, patchLength, 'mm');
        % ---- assign PE boundary
        hfssAssignPE(fid, 'Patch33', {'Patch33'});
        % ---- set Color
        hfssSetColor(fid, 'Patch33', [255, 255, 0]);
        % ---- set Transparency
        hfssSetTransparency(fid, {'Patch33'}, 0);
    end

%         fprintf('创建贴片阵列（Patch Array）---->完毕\n\n');
%}
%% ---- 创建开关（Switch）
    for ii = 1:1:1  % ---- 此处for循环只执行一次循环体，存在的意义是：为了折叠程序
        % ---- 创建开关11（Switch11）
            if tmpSwtichArray(1) == 1
                hfssRectangle(fid, 'Switch11', 'Z', [-(centreDistance + switchWidth/2), ...
                    -(centreDistance - patchLength/2), height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch11', {'Switch11'});
                % ---- set Color
                hfssSetColor(fid, 'Switch11', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch11'}, 0);
            end
        % ---- 创建开关12（Switch12）
            if tmpSwtichArray(2) == 1
                hfssRectangle(fid, 'Switch12', 'Z', [-(centreDistance + switchWidth/2), ...
                    patchLength/2, height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch12', {'Switch12'});
                % ---- set Color
                hfssSetColor(fid, 'Switch12', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch12'}, 0);
            end


        % ---- 创建开关21（Switch21）
            if tmpSwtichArray(3) == 1
                hfssRectangle(fid, 'Switch21', 'Z', [-(centreDistance - patchLength/2), ...
                    -(centreDistance + switchWidth/2), height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch21', {'Switch21'});
                % ---- set Color
                hfssSetColor(fid, 'Switch21', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch21'}, 0);
            end
        % ---- 创建开关22（Switch22）
            if tmpSwtichArray(4) == 1
                hfssRectangle(fid, 'Switch22', 'Z', [-(centreDistance - patchLength/2), ...
                    -switchWidth/2, height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch22', {'Switch22'});
                % ---- set Color
                hfssSetColor(fid, 'Switch22', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch22'}, 0);
            end
        % ---- 创建开关23（Switch23）
            if tmpSwtichArray(5) == 1
                hfssRectangle(fid, 'Switch23', 'Z', [-(centreDistance - patchLength/2), ...
                    centreDistance - switchWidth/2, height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch23', {'Switch23'});
                % ---- set Color
                hfssSetColor(fid, 'Switch23', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch23'}, 0);
            end


        % ---- 创建开关31（Switch31）
            if tmpSwtichArray(6) == 1
                hfssRectangle(fid, 'Switch31', 'Z', [-switchWidth/2, -(centreDistance - patchLength/2), ...
                    height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch31', {'Switch31'});
                % ---- set Color
                hfssSetColor(fid, 'Switch31', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch31'}, 0);
            end
        % ---- 创建开关32（Switch32）
            if tmpSwtichArray(7) == 1
                hfssRectangle(fid, 'Switch32', 'Z', [-switchWidth/2, patchLength/2, ...
                    height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch32', {'Switch32'});
                % ---- set Color
                hfssSetColor(fid, 'Switch32', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch32'}, 0);
            end


        % ---- 创建开关41（Switch41）
            if tmpSwtichArray(8) == 1
                hfssRectangle(fid, 'Switch41', 'Z', [patchLength/2, -(centreDistance + switchWidth/2), ...
                    height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch41', {'Switch41'});
                % ---- set Color
                hfssSetColor(fid, 'Switch41', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch41'}, 0);
            end
        % ---- 创建开关42（Switch42）
            if tmpSwtichArray(9) == 1
                hfssRectangle(fid, 'Switch42', 'Z', [patchLength/2, -switchWidth/2, ...
                    height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch42', {'Switch42'});
                % ---- set Color
                hfssSetColor(fid, 'Switch42', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch42'}, 0);
            end
        % ---- 创建开关43（Switch43）
            if tmpSwtichArray(10) == 1
                hfssRectangle(fid, 'Switch43', 'Z', [patchLength/2, centreDistance - switchWidth/2, ...
                    height], switchLength, switchWidth, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch43', {'Switch43'});
                % ---- set Color
                hfssSetColor(fid, 'Switch43', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch43'}, 0);
            end


        % ---- 创建开关51（Switch51）
            if tmpSwtichArray(11) == 1
                hfssRectangle(fid, 'Switch51', 'Z', [centreDistance - switchWidth/2, ...
                    -(centreDistance - patchLength/2), height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch51', {'Switch51'});
                % ---- set Color
                hfssSetColor(fid, 'Switch51', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch51'}, 0);
            end
        % ---- 创建开关52（Switch52）
            if tmpSwtichArray(12) == 1
                hfssRectangle(fid, 'Switch52', 'Z', [centreDistance - switchWidth/2, ...
                    patchLength/2, height], switchWidth, switchLength, 'mm');
                % ---- assign PE boundary
                hfssAssignPE(fid, 'Switch52', {'Switch52'});
                % ---- set Color
                hfssSetColor(fid, 'Switch52', [227, 207, 87]); % ---- [227, 207, 87]---->香蕉黄
                % ---- set Transparency
                hfssSetTransparency(fid, {'Switch52'}, 0);
            end

     % ---- 合并所有的贴片和开关
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

%         hfssUnite(fid, {'Patch11', 'Patch12', 'Patch13', 'Patch21', ...
%             'Patch22', 'Patch23', 'Patch31', 'Patch32', 'Patch33', ...
%             'Switch11', 'Switch12', 'Switch21', 'Switch22', 'Switch23', ...
%             'Switch31', 'Switch32', 'Switch41', 'Switch42', 'Switch43', ...
%             'Switch51', 'Switch52'});

    end

%         fprintf('创建开关（Switch）---->完毕\n\n'); 

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

%         fprintf('创建馈线（Feed）---->完毕\n\n');
%% ---- 创建地平面（GND）
    for ii = 1:1:1  % ---- 此处for循环只执行一次循环体，存在的意义是：为了折叠程序
        hfssRectangle(fid, 'GroundPlane', 'Z', [-substrateLength/2, -substrateLength/2, 0], ...
            substrateLength, substrateLength, 'mm');
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

%         fprintf('创建地平面（GND）---->完毕\n\n');
%% ---- 创建馈电口（Port）
    hfssCircle(fid, 'Port', 'Z', [portX, portY, 0], inputDiameter/2, 'mm');
    % ---- Assign Lumped Port
    hfssAssignLumpedPort(fid, 'LumpedPort', 'Port', [portX + portDiameter/2, portY, 0], ...
        [portX + inputDiameter /2, portY, 0], 'mm');

%         fprintf('创建馈电口（Port）---->完毕\n\n');

%% ---- 创建空气盒子（Box）
    hfssBox(fid, 'AirBox', [-(centreDistance + 1.2 * patchLength + maxWavelength), ...
        -(centreDistance + 1.2 * patchLength + maxWavelength), -10], ...
        [2 * (centreDistance + 1.2 * patchLength + maxWavelength), ...
        2 * (centreDistance + 1.2 * patchLength + maxWavelength), ...
        height + maxWavelength + 10], 'mm');
    % ---- Assign Radiation
    hfssAssignRadiation(fid, 'AirBoxRadiation', 'AirBox');
    % ---- set Transparency
    hfssSetTransparency(fid, {'AirBox'}, 0.95);

%         fprintf('创建空气盒子（Box）---->完毕\n\n');
%}