# AI-for-Lung-Cancer-Detection-Using-Transfer-Learning-and-Morphological-Features

### Abstract:
Lung cancer is an uncontrolled growth of tissue causing a lump in the human lung.
If lung cancer can be detected early, it can increase the survival rate. Therefore, a
multi-classification approach of lung nodule detection with high computational
effectiveness is required. In this paper, a multi-classification approach of lung nodule detection and classification is proposed using artificial intelligence on computed
tomography (CT) scan images. Different preprocessing steps are applied for resizing, smoothing, and enhancement of the CT images. Then, two different approaches
for feature extraction using VGG16 transfer learning and morphological segmentation are proposed. Morphological segmentation and feature extraction are applied
for the segmentation of the region of interest and to extract the distinct features.
Finally, the proposed deep learning architecture and seven different machine learning algorithms are applied on the preprocessed data and the extracted features for
the classification of lung nodules into three classes: malignant, benign, and normal.
It is observed that the stacked ensemble model of deep learning convolutional neural
network (CNN) and VGG16 transfer learning models (CNN+VGG16) can achieve
99.55% accuracy using preprocessed data. It is also observed that all the ML algorithms perform with reasonably high accuracy using the low-dimensional morphological features. It is observed from the fivefold cross-validation results that logistic
regression performs with 99.36% accuracy in 23.71 s time using the preprocessed
data. Whereas, using the morphological features, k-nearest neighbor, and the support vector machine perform with the highest accuracy of 99.76% with very reduced
computational time of 0.017 and 0.008 s, respectively.
Keywords Lung cancer recognition · Transfer learning · Morphological feature
extraction
