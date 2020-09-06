
function [ output_args ] = transformations(rx,ry,rz,sx,sy,sz,tx,ty,tz,operation_order)

    syms u v 
    % Surface Plot %
    x = cos(u)*sin(v);
    y = sin(u)*sin(v);
    z = cos(v)*sin(v);
    
    S = [sx 0 0 0; 0 sy 0 0; 0 0 sz 0 ; 0 0 0 1]; %Scale Matrix%
    
    %Rotate Matrixes%
    Rx = [1 0 0 0; 0 cos(rx) -sin(tx) 0 ; 0 sin(rx) cos(rx) 0; 0 0 0 1];
    Ry = [cos(ry) 0 sin(ry) 0 ; 0 1 0 0; -sin(ry) 0  cos(ry) 0 ; 0 0 0 1];
    Rz = [cos(rz) -sin(rz) 0 0; sin(rz) cos(rz) 0 0; 0 0 1 0; 0 0 0 1];
    
    T = [1 0 0 tx; 0 1 0 ty; 0 0 1 tz; 0 0 0 1]; %Translation Matrix%%
    
    plot1 = [x;y;z;1];
    
    fsurf(x,y,z);
    colormap('jet');
    title('Original Plot');

    if rx~=0 || ry~=0 || rz~=0 || sx~=0 || sy~=0 || sz~=0 || tx~=0 || ty~=0 || tz~=0
        for i = 1:length(operation_order)
            switch operation_order(i)
                    %ROTATE
                case 'r'
                     if rx ~= 0 || ry ~= 0 || rz ~= 0  
                        xyzRx = Rx*plot1;
                        xyzRy = Ry* xyzRx;
                        xyzRz = Rz* xyzRy;
                        plot1 = xyzRz; 
                        figure
                        fsurf(plot1(1), plot1(2), plot1(3));
                        colormap('jet');
                        title('Rotated Plot');
                        
                     else    
                         figure
                         fsurf(plot1(1), plot1(2), plot1(3));
                         colormap('jet');
                         title('No rotate');
                     end
                     
                       % SCALE
                case 's' 
                    if sx == 1 && sy == 1 && sz == 1
                        figure
                        fsurf(plot1(1), plot1(2), plot1(3));
                        colormap('jet');
                        title('No Scale');
                        
                    else
                        plot1 = S * plot1; 
                        figure
                        fsurf(plot1(1), plot1(2), plot1(3));
                        colormap('jet');
                        title('Scaled Plot');
                        
                    end
                    
                        %TRANSLATION
                case 't'
                    if tx ~=0 || ty~=0 || tz~=0
                        plot1 = T*plot1;
                        figure
                        fsurf(plot1(1), plot1(2), plot1(3));
                        colormap('jet');
                        title('Translated Plot');
                    else
                        figure
                        fsurf(plot1(1), plot1(2), plot1(3));
                        colormap('jet');
                        title('No Translatation');
                    end
            end
        end    
    end
end

