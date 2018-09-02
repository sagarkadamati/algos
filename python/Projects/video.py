import numpy as np
import cv2

cap = cv2.VideoCapture("001 The Legend of Bhishma.mp4")

count = 0
x = 0
y = 0
w = 0
h = 0

while(cap.isOpened()):
    count += 1

    ret, frame = cap.read()
    if (count < 1000):        
        try:
            gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
            _, thresh = cv2.threshold(gray,10,255,cv2.THRESH_BINARY)
            
            img, contours, hierarchy = cv2.findContours(thresh, cv2.RETR_EXTERNAL, cv2.CHAIN_APPROX_SIMPLE)
            cnt = contours[0]
            tx, ty, tw, th = cv2.boundingRect(cnt)
            # print("Width: " + str(w) + ", Height: " + str(h))
            if (tw > 100 and th > 100):
                if (tw > w):
                    x, w = tx, tw
                if (th < h):
                    y, h = ty, th
                if (w == 0 or h == 0):
                    x, y, w, h = tx, ty, tw, th
        except:
            pass
        if (count == 999):
            cap.set(cv2.CAP_PROP_POS_FRAMES, 0);
            print("Width: " + str(w) + ", Height: " + str(h) + ", FPS: " + str(cap.get(cv2.CAP_PROP_FPS)))

            # print(cap.get(cv2.CAP_PROP_FOURCC))
            # out = cv2.VideoWriter('tmp.mp4', cap.get(cv2.CAP_PROP_FOURCC), cap.get(cv2.CAP_PROP_FPS), (w, h))
            # out = cv2.VideoWriter('tmp.mp4', cv2.VideoWriter_fourcc(*'mp4v'), cap.get(cv2.CAP_PROP_FPS), (w, h))
            out = cv2.VideoWriter('tmp.mp4', cv2.VideoWriter_fourcc('A','V','C','1'), cap.get(cv2.CAP_PROP_FPS), (w, h))
    else:
        crop = frame[y:y+h, x:x+w]
        out.write(crop)
        # cv2.imshow("Frames", crop)
        # if cv2.waitKey(1) & 0xFF == ord('q'):
        #     break

        # if (count > 5000):
        #     break

cap.release()
out.release()
cv2.destroyAllWindows()