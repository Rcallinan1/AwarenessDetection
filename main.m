function [result] = main(inputImage)
    [eye, bigEyes, bbEyes] = GetEye(inputImage);
    if(exist('eye') ~= 1 || exist('bigEyes') ~= 1 || exist('bbEyes') ~= 1)
       result = 'No Pupil';
    elseif(eye == 0)
        result = 'No Face';
       clear eye;
       clear bigEyes;
       clear bbEyes;
    else
       disp(eye);
       result = EyeStatus(eye,bigEyes,bbEyes);
       clear eye;
       clear bigEyes;
       clear bbEyes;
    end
end

