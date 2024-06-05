# Author
# Soohwan Kim, Seyoung Bae, Cheolhwang Won, Soyoung Cho, Jeongwon Kwak

DATASET_PATH="/content/drive/MyDrive/2024 3-1 DL/Team_project/SampleData/audio_data"
VOCAB_DEST='/content/drive/MyDrive/2024 3-1 DL/Team_project/SampleData/label_dataset'
OUTPUT_UNIT='character' 
PREPROCESS_MODE='phonetic'
VOCAB_SIZE=5000

echo "Pre-process KsponSpeech Dataset.."

python main.py \
--dataset_path $DATASET_PATH \
--vocab_dest $VOCAB_DEST \
--output_unit $OUTPUT_UNIT \
--preprocess_mode $PREPROCESS_MODE \
--vocab_size $VOCAB_SIZE \
