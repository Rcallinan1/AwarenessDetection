function [outputArg1] = segmentation(inputArg1)
    img = inputArg1;
    
    faceDetector = vision.CascadeObjectDetector();
    eyeDetector = vision.CascadeObjectDetector('EyePairSmall');
    bb = step(faceDetector,img);
    
    %Detect the biggest box, which is the face
    bigBox=1;     
         for i=1:rank(bb) 
             if bb(i,3)>bb(bigBox,3)
                 bigBox=i;
             end
         end
    
    faceImage = imcrop(img,bb(bigBox,:));
    bbEyes = step(eyeDetector,faceImage);
    
    %Find biggest Eyes;
    bigEyes = 1;
    for i = 1:rank(bbEyes)
        if bbEyes(i,3) > bbEyes(bigEyes,3)
            bigEyes = i;
        end
    end
    
    bbOneEye=[bbEyes(bigEyes,1),bbEyes(bigEyes,2),bbEyes(bigEyes,3)/3,bbEyes(bigEyes,4)];   %resize the eyepair width in half
    eye = imcrop(faceImage,bbOneEye(1,:));
    outputArg1 = eye;
    
end

