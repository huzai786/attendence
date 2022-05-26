import face_recognition
from numpy import array
import pickle


img1 = face_recognition.load_image_file('userImages/dt.jpeg')
img2 = face_recognition.load_image_file('userImages/rn.jpeg')
d2 = face_recognition.load_image_file('userImages/d2.jpg')

d_encod = face_recognition.face_encodings(img1)[0]
r_encod = face_recognition.face_encodings(d2)[0]
result = face_recognition.compare_faces([d_encod], r_encod)
print(r_encod)
print(result[0])

# lis = [array([
#        -1.40015557e-01,  4.27329615e-02,  6.00885972e-02, -4.43087658e-03,
#        -1.74408495e-01,  7.49587044e-02, -2.10565906e-02,  2.47991439e-02,
#         1.50727421e-01, -1.63039565e-01,  1.67510509e-01, -3.95097472e-02,
#        -3.07729185e-01,  4.90350388e-02, -3.94789875e-02,  1.29555970e-01,
#        -1.24885738e-01, -1.03595696e-01, -1.22746058e-01, -1.68619171e-01,
#        -6.89596962e-03,  1.01514675e-01, -6.40484178e-03,  4.03936394e-03,
#        -1.59571901e-01, -2.87889600e-01, -9.41325277e-02, -1.39331356e-01,
#         7.06036836e-02, -1.81973740e-01,  5.35179526e-02,  1.51186148e-02,
#        -1.13093086e-01, -4.26064245e-03,  1.59244612e-03,  5.28218448e-02,
#        -2.59501021e-02, -1.32996678e-01,  2.40798980e-01,  1.39633454e-02,
#        -1.12933233e-01, -6.43679779e-03,  5.72438017e-02,  2.90840715e-01,
#         4.28420603e-02, -6.70330925e-03, -5.91296144e-03, -2.07252428e-03,
#         1.53182879e-01, -3.08188081e-01,  1.06178410e-01,  3.51802446e-02,
#         2.08110765e-01,  7.60151371e-02,  1.37697905e-01, -1.47875085e-01,
#         3.67493518e-02,  2.22771779e-01, -2.40842283e-01,  2.04951495e-01,
#         3.61441635e-03, -7.91596472e-02, -5.99323213e-02, -3.70154493e-02,
#         2.00379461e-01,  1.57943666e-01, -7.21082166e-02, -1.86472759e-01,
#         2.18653455e-01, -1.76577017e-01, -6.60583153e-02,  1.78074479e-01,
#        -6.04182519e-02, -1.46766245e-01, -2.48543754e-01,  5.97406067e-02,
#         3.82056683e-01,  1.53680995e-01, -1.19046010e-01, -6.37680590e-02,
#         4.63804454e-02, -7.49192610e-02,  2.29308731e-04,  8.48474056e-02,
#        -1.35584041e-01, -1.08076438e-01, -1.52686322e-02,  9.44036543e-02,
#         2.53823876e-01,  1.67554133e-02, -1.12441123e-01,  2.29893774e-01,
#         6.73388988e-02,  1.02793630e-02, -1.48663437e-02, -3.08078881e-02,
#        -3.19846869e-02, -8.25483873e-02, -3.36047374e-02,  5.21006472e-02,
#         8.22072625e-02, -1.39201850e-01, -5.56222126e-02,  7.19063282e-02,
#        -1.88257754e-01,  1.11133382e-01, -6.79257661e-02, -1.02633193e-01,
#        -2.87285037e-02,  2.70031802e-02, -1.75193146e-01,  1.01834163e-01,
#         2.56802559e-01, -3.52581024e-01,  1.97489381e-01,  2.13770762e-01,
#         5.93642071e-02,  1.00579023e-01,  1.53988097e-02, -3.17494497e-02,
#         9.95291620e-02, -5.22576421e-02, -2.09042907e-01, -1.41472623e-01,
#         8.84460732e-02, -1.36763513e-01, -1.97917186e-02,  5.48688658e-02])][0]

# byt = pickle.dumps(lis)
# print(byt)
# print(type(byt))
# print(pickle.loads(byt))
# print(type(pickle.loads(byt)))



def detect_face(unknown_encoding, known_encoding):
    try:
        result = face_recognition.compare_faces([known_encoding], unknown_encoding)
    except Exception as e:
        print(e)
        return None
