%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ---- ���ű����ڴ�����ع����ߵ�����HFSS���ò��� ---- %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % ---- ��λ��GHz
    
    %{
        ---- ע�� ----
        ---- ע�� ----
        ---- ע�� ----
            �˽ű��������Ƶ��setupFreq��ɨ��Ƶ��sweep���Լ����Ƕ�Ӧ��HFSS��ʽ���ַ�������
        ---- ע�� ----
        ---- ע�� ----
        ---- ע�� ----
    %}
    
%% ---- HFSS���ò���
    % ---- HFSS���Ƶ��
        setupFreq = 4;
        % ---- ���ú����õ�setupFreq��HFSS��ʽ���ַ�����ʽ
            %{
                ---- ע�� ----
                ---- ע�� ----
                ---- ע�� ----
                    һ�����ֵ�HFSSģʽ���ַ�����ʽ���ǣ�
                        ��һ������ת��Ϊ�ַ���
                            ����ַ���������'.'����'.'�滻Ϊ'_'
                                ֮������������ΪHFSS�������Ƶ�ʵ�������֧��'.'��������Ҫ�滻Ϊ'_'

                        ���ӣ�
                            5       ---->   5
                            5.64    ---->   5_64
        
                    �����ľ�����Ϣ�μ�GetHFSSName.m
                ---- ע�� ----
                ---- ע�� ----
                ---- ע�� ----
            %}
            setupFreqName = getHFSSName(setupFreq);
        % ---- �õ�SetupName��ͨ���ַ�����ƴ��
            setupName = ['Setup' setupFreqName 'GHz'];

            
    % ---- HFSSɨƵ����
        % ---- ɨƵ��ʼƵ��
            startFreq = 1;
            % ---- ���ú����õ�startFreq��HFSS��ʽ���ַ�����ʽ
                %{
                ---- ע�� ----
                ---- ע�� ----
                ---- ע�� ----
                    һ�����ֵ�HFSSģʽ���ַ�����ʽ���ǣ�
                        ��һ������ת��Ϊ�ַ���
                            ����ַ���������'.'����'.'�滻Ϊ'_'
                                ֮������������ΪHFSS�������Ƶ�ʵ�������֧��'.'��������Ҫ�滻Ϊ'_'

                        ���ӣ�
                            5       ---->   5
                            5.64    ---->   5_64
        
                    �����ľ�����Ϣ�μ�GetHFSSName.m
                ---- ע�� ----
                ---- ע�� ----
                ---- ע�� ----
            %}
                startFreqName = getHFSSName(startFreq);
        % ---- ɨƵ��ֹƵ��
            stopFreq = 11;
            % ---- ���ú����õ�stopFreq��HFSS��ʽ���ַ�����ʽ
                %{
                    ---- ע�� ----
                    ---- ע�� ----
                    ---- ע�� ----
                        һ�����ֵ�HFSSģʽ���ַ�����ʽ���ǣ�
                            ��һ������ת��Ϊ�ַ���
                                ����ַ���������'.'����'.'�滻Ϊ'_'
                                    ֮������������ΪHFSS�������Ƶ�ʵ�������֧��'.'��������Ҫ�滻Ϊ'_'

                            ���ӣ�
                                5       ---->   5
                                5.64    ---->   5_64

                        �����ľ�����Ϣ�μ�GetHFSSName.m
                    ---- ע�� ----
                    ---- ע�� ----
                    ---- ע�� ----
                %}  
                stopFreqName = getHFSSName(stopFreq);
        % ---- �õ�sweepName
            sweepName = ['Fast' startFreqName 'to' stopFreqName 'GHz'];