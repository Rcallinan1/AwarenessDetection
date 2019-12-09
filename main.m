function [result] = main(inputImage)
    [eye, bigEyes, bbEyes] = GetEye(inputImage);
    if(exist('eye') ~= 1 || exist('bigEyes') ~= 1 || exist('bbEyes') ~= 1)
       result = 'No Face';
    elseif(eye == 0)
        result = 'No Pupil';      
    else
       disp(eye);
       result = EyeStatus(eye,bigEyes,bbEyes);
    end
end

