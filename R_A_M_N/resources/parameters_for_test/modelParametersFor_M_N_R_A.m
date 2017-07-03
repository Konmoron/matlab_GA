%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- 本脚本用于储存可重构天线的所有已知参数 ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- 单位：mm


%% ---- 将所有的变量定义为全局变量：global
    global patchLength centreDistance maxWavelength... % ---- 基本参数
           portDiameter inputDiameter portX portY... % ---- 馈点参数
           height substrateLength_X substrateLength_Y... % ---- 基板参数
           patchCoordinateArr_X patchCoordinateArr_Y ... % ---- 贴片参数
           switchLength switchWidth switchCoordinateArr_X_Row switchCoordinateArr_Y_Row switchCoordinateArr_X_Col switchCoordinateArr_Y_Col numOfSwitch... % ---- 开关参数
           m n; % ---- 可重构天线的行数和列数
%% ---- 判断行数m和列数n是否满足要求
    % ---- 判断m的值
        % ---- 判断m是否小于等于1
            if m <= 1
                error('ErrorTests:convertTest', ... 
                    '\n    行数m必须大于1');
            end
        % ---- 判断m是否为整数
            if m ~= round(m)
                error('ErrorTests:convertTest', ... 
                    '\n    行数m必须为整数');
            end
    % ---- 判断n的值
        % ---- 判断n是否小于等于1
            if n <= 1
                error('ErrorTests:convertTest', ... 
                    '\n    列数n必须大于1');
            end
        % ---- 判断n是否为整数
            if n ~= round(n)
                error('ErrorTests:convertTest', ... 
                    '\n    列数n必须为整数');
            end
%% ---- 贴片参数
    % ---- 正方形金属贴片的边长(patchLength)   9.398
        patchLength = 9.398;
    % ---- 相邻金属贴片中心距(centreDistence)	14.986
        centreDistance = 14.986;
    % ---- 所有贴片的宽度和长度
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                HFSS里面的坐标系是正常坐标系顺时针旋转90°
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        allPatchLength_X = (m - 1) * centreDistance + patchLength;
        allPatchLength_Y = (n - 1) * centreDistance + patchLength;
    % ---- 贴片坐标数组
        % ---- X方向
            % ---- 创建一个具有m个数的数组
                %{ 
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        创建一个具有m个数的数组，数组内的元素初始值全部为1
                        patchCoordinateArr_X里面储存了每一列贴片左边的坐标
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                patchCoordinateArr_X = ones(1, m);
            % ---- 设置patchCoordinateArr_X里面每个元素的值
                for ii = 1:1:m
                    patchCoordinateArr_X(ii) = -allPatchLength_X/2 + (ii - 1) * centreDistance;
                end
        % ---- Y方向
            % ---- 创建一个具有n个数的数组
            %{ 
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        创建一个具有n个数的数组，数组内的元素初始值全部为1
                        patchCoordinateArr_Y里面储存了每一行贴片上边的坐标
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                patchCoordinateArr_Y = ones(1, n);
            % ---- 设置patchCoordinateArr_Y里面每个元素的值
                for ii = 1:1:n
                    patchCoordinateArr_Y(ii) = -allPatchLength_Y/2 + (ii - 1) * centreDistance;
                end
%% ---- 开关参数
    % ---- 开关的基本参数
        % ---- RF MEMS开关的长度(switchLength)	centreDistence - patchLength
            % ---- 为修改之前的长度
            % ---- switchLength = 2.159;

            % ---- 修改说明 ---- %
            % ---- 为了建模方便，开关的长度等于一个贴片的一边到另一个贴片的另一边的距离
            % ---- 也即是：centreDistence - patchLength
                switchLength = centreDistance - patchLength;
        % ---- RF MEMS开关的宽度(switchWidth)	1.27
            switchWidth = 1.27;
    % ---- 确定开关的个数
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                开关的个数等于行开关的个数+列开关的个数
                    行开关就是位于行与行之间的开关，个数为：(m -1) * n
                    列开关就是位于列与列之间的开关，个数为：(n -1) * m
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        % ---- 得到行开关的个数
            numOfRowSwitch = (m -1) * n;
        % ---- 得到列开关的个数
            numOfColSwitch = (n -1) * m;
        % ---- 得到总的开关个数
            numOfSwitch = (m -1) * n + (n -1) * m;
    % ---- 列开关参数
        % ---- 列开关第一个开关的顶点坐标
            % ---- 得到X方向的坐标
                startSwitchCoordinate_X_Col = -allPatchLength_X/2 + (patchLength/2 - switchWidth/2);
            % ---- 得到X方向的坐标
                startSwitchCoordinate_Y_Col = -allPatchLength_Y/2 + patchLength;
        % ---- 创建列开关X方向的坐标数组
            %{ 
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    列开关X方向共有m个坐标
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            % ---- 创建一个具有m个数的数组
                %{ 
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        创建一个具有m个数的数组，数组内的元素初始值全部为1
                        switchCoordinateArr_X_Col里面储存了列开关左边顶点上方的X方向坐标
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                switchCoordinateArr_X_Col = ones(1, m);
            % ---- 设置switchCoordinateArr_X_Row里面每个元素的值
                for ii = 1:1:m
                    switchCoordinateArr_X_Col(ii) = startSwitchCoordinate_X_Col + (ii - 1) * centreDistance;
                end
        % ---- 创建列开关Y方向的坐标数组
            %{ 
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    列开关Y方向共有n - 1个坐标
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            % ---- 创建一个具有n - 1个数的数组
                %{ 
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        创建一个具有n - 1个数的数组，数组内的元素初始值全部为1
                        switchCoordinateArr_Y_Row里面储存了列开关左边顶点上方的Y方向坐标
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                switchCoordinateArr_Y_Col = ones(1, n - 1);
            % ---- 设置switchCoordinateArr_Y_Row里面每个元素的值
                for ii = 1:1:n-1
                    switchCoordinateArr_Y_Col(ii) = startSwitchCoordinate_Y_Col + (ii - 1) * centreDistance;
                end
    % ---- 行开关参数
        % ---- 行开关第一个开关的顶点坐标
            % ---- 得到X方向的坐标
                startSwitchCoordinate_X_Row = -allPatchLength_X/2 + patchLength;
            % ---- 得到X方向的坐标
                startSwitchCoordinate_Y_Row = -allPatchLength_Y/2 + (patchLength/2 - switchWidth/2);
        % ---- 创建行开关X方向的坐标数组
            %{ 
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    行开关X方向共有m-1个坐标
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            % ---- 创建一个具有m-1个数的数组
                %{ 
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        创建一个具有m-1个数的数组，数组内的元素初始值全部为1
                        switchCoordinateArr_X_Row里面储存了列开关左边顶点上方的X方向坐标
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                switchCoordinateArr_X_Row = ones(1, m-1);
            % ---- 设置switchCoordinateArr_X_Row里面每个元素的值
                for ii = 1:1:m-1
                    switchCoordinateArr_X_Row(ii) = startSwitchCoordinate_X_Row + (ii - 1) * centreDistance;
                end
        % ---- 创建行开关Y方向的坐标数组
            %{ 
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
                    列开关Y方向共有n个坐标
                ---- 注意 ----
                ---- 注意 ----
                ---- 注意 ----
            %}
            % ---- 创建一个具有n个数的数组
                %{ 
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                        创建一个具有n个数的数组，数组内的元素初始值全部为1
                        switchCoordinateArr_Y_Row里面储存了列开关左边顶点上方的Y方向坐标
                    ---- 注意 ----
                    ---- 注意 ----
                    ---- 注意 ----
                %}
                switchCoordinateArr_Y_Row = ones(1, n);
            % ---- 设置switchCoordinateArr_Y_Col里面每个元素的值
                for ii = 1:1:n
                    switchCoordinateArr_Y_Row(ii) = startSwitchCoordinate_Y_Row + (ii - 1) * centreDistance;
                end        
%% ---- 基底参数
% ---- 正方形基底的厚度(height)	3.175
    height = 3.175;
% ---- 正方形基底的边长(substrateLength)	52.5272
    % ---- 为修改之前的长度
    % substrateLength = 52.5272;
    
    % ---- 修改说明 ---- %
    % ---- 为了获取更好的性能，缩短基底的长度
    % ---- 缩短为：2*( centreDistance+0.8* patchLength)
    substrateLength_X = (m - 1) * centreDistance + 1.6 * patchLength;
    substrateLength_Y = (n - 1) * centreDistance + 1.6 * patchLength;
%% ---- 馈点参数   
    % ---- 馈电线直径(portDiameter)	1.2
        portDiameter = 1.2;
    % ---- 输入端口直径(inputDiameter)	3
        inputDiameter = 3;
    % ---- 确定馈点贴片
        %{ 
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
                馈点贴片为第一象限内离原点最近的那个贴片
                例如：
                    如果是5×5贴片阵列：馈点贴片为3×3那个贴片
                    如果是4×6贴片阵列：馈点贴片为3×4那个贴片
                    如果是4×5贴片阵列：馈电贴片为3×3那个贴片
            ---- 注意 ----
            ---- 注意 ----
            ---- 注意 ----
        %}
        portPatch_X = fix(m/2 + 1);
        portPatch_Y = fix(n/2 + 1);
    % ---- 馈电点X轴坐标(portX)
        portX = -allPatchLength_X/2 + (portPatch_X - 1) * centreDistance + patchLength/2 + 3;
    % ---- 馈电点Y轴坐标(portY)
        portY = -allPatchLength_Y/2 + (portPatch_Y - 1) * centreDistance + patchLength/2 + 3;
%% ---- 空气盒子参数
    % ---- maxWavelength
        maxWavelength = 30;