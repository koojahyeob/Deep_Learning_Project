# 24-1 DL Team Project SilverSpeak

**kospeech를 활용한 노인 발화 전사 모델 구축과 키오스크 음성 인식**

## 1. Motivation for the project
- 현재 우리 사회는 고령화가 급속하게 진행되고 있으며 기술의 발전에 따른 서비스의 디지털 전환 동시에 이뤄지고 있다.
- 이 때문에 많은 서비스들이 디지털화되면서 디지털 서비스 이용에 비교적 미숙한 고령층들이 어려움을 겪고 있다. 특히 키오스크 주문 방을 사용하는 매장이 늘어남에 따라 키오스크 작동이 미숙한 고령 인구가 카운로 향하는 모습은 주변에서 흔히 볼 수 있는 광경이다.
- 따라서 본 프로젝트를 통해 노인 음성이 주가 되는 음성 인식 모델을 만들고 이를 키오스크에 적용하여 노인의 디지털 서비스 접근성을 높이고자 한다.
<br>


## 2. Data - 파일 경로

```bash
├── README.md
├── SampleData
│   ├── audio_data
│   ├── label_dataset
│   ├── test_wav
│   ├── test_label
│   ├── testscript
│   ├── vocab
│   ├── pre_processed_test_wav
│   └── result
│
├── bin 		
│   ├── eval.py
│   ├── inference.py
│   ├── inference_wer.py
│   ├── main.py
│   ├── prediction.py
│   ├── tools.py
│   └── kospeech
│       ├── utils.py
│       ├── model_builder.py
│       ├── metrics.py
│	├── data
│		├── ..
│		├── ..
│	├── models
│		├── ..
│
├── configs
│	├── train.yaml
│	├── eval.yaml
│	├── ..
│	├── ..
│
│
└── deeplearningfinal.ipynb

```

## 3. Model

- DeepSpeech2 모델
- 논문 링크 : [https://arxiv.org/abs/1512.02595](https://arxiv.org/abs/1512.02595)

Kospeech 모델은 DeepSpeech2 모델을 기반으로 구축되며, 주로 CTC (Connectionist Temporal Classification) 손실 함수 사용 <br>

- DeepSpeech2 모델 구조
  
  - **입력 처리**:
      - 입력 오디오를 스펙트로그램 형태로 변환하여 시간-주파수 도메인에서 오디오 신호를 표현
  - **합성곱 층 (Convolutional Layers)**:
      - 몇 개의 합성곱 층을 통해 입력 스펙트로그램의 저수준 특징을 추출, 차원을 줄여 더 높은 수준의 특징을 인코더로 전달
  - **양방향 RNN 층 (Bidirectional RNN Layers)**:
      - 여러 층의 양방향 RNN (주로 GRU 또는 LSTM)을 사용하여 시간 순서와 역순으로 데이터를 처리하여 앞뒤 문맥 정보를 모두 활용
  - **완전 연결 층 (Fully Connected Layers)**:
      - RNN 층의 출력을 하나 이상의 완전 연결 층으로 변환하여 최종 출력 차원을 줄임
  - **출력층 (Output Layer)**:
      - 각 시간 단계에서의 문자 확률을 나타내는 소프트맥스 층으로 구성되며, 알파벳 문자와 블랭크 토큰이 포함
        
- CTC 손실 함수

    - **정렬 문제 해결**:
        - 입력 시퀀스와 출력 시퀀스의 길이가 다를 때, 다양한 정렬 경로의 확률을 계산하여 정렬 문제를 해결
    - **블랭크 토큰 사용**:
        - 블랭크 토큰을 도입하여 출력 시퀀스에서 특정 위치가 비어있음을 나타내며, 가변 길이의 입력과 출력을 효과적으로 정렬
<img width="270" alt="image" src="https://github.com/koojahyeob/Deep_Learning_Project/assets/70992152/ffece009-914e-4f37-9077-2aa3a84b9178">

**DeepSpeech2 모델구조**


## 4. Result
*  [데모영상](https://github.com/koojahyeob/Deep_Learning_Project/assets/70992152/a1ec7b6e-1df1-471b-9e51-31c543420016)



- 최종 결과
<img width="609" alt="image" src="https://github.com/koojahyeob/Deep_Learning_Project/assets/70992152/c9af25c4-e90f-4742-9b7c-6ee657de736b">

## 5. Contributors
- 구자협
    - 모델 구조 파악
    - 모델 학습
- 진민찬
    - 모델 학습
    - 발표
- 남천우
    - 데이터 전처리
    - 데모 재현
- 전시현
    - 데이터 전처리
    - 모델 학습

## 참고자료
[https://github.com/sooftware/kospeech](https://github.com/sooftware/kospeech)
