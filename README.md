# 캡스톤디자인1 (CSE4186), 2021-1
## 프로젝트명
sns기반 성격 유형 예측 시스템
인스타그램 계정을 분석하여 sns 성격 유형을 예측해주는 시스템

## 슬로건
> 심리테스트 하기 귀찮아~ 한번에 나오는 SNS 성격 유형I!   

최근 3년동안 MBTI(Myers-Briggs Type Indicator)로 성격 유형을 분석하는 것이 유행이 되었다.  
그러나 지난 많은 mbti 테스트는 단순하고 정형화된 문항으로 이루어져 있었다.  
이는 많은 시간을 소요하며, mbti 분석에 대한 신뢰성을 떨어뜨렸다.  
따라서 기존에 사용하던 sns 계정 아이디만 입력하면 자동으로 성격 유형을 분석하는 시스템 개발을 진행하게 되었다.   
또한, 이를 통해 실생활에서 드러나는 성격과는 다른 개인의 sns 성향을 살펴볼 수 있다.   

## 팀 역할분담
| 이름 | 학번 | 학과 | 역할 |
|---|---|---|---|
| 양희원 | 20181652 | 컴퓨터공학과 | 이미지 크롤링, UX/UI, ppt |   
| 오정연 | 20181657 | 컴퓨터공학과 | 크롤링, 머신러닝, 발표 |   
| 장서우(조장) | 20181679 | 컴퓨터공학과 | 크롤링, 머신러닝, 위키페이지 관리, 데모영상제작 |   


## 프로젝트 소개

### 동기
* 기존의 MBTI는 대상자가 직접 설문에 응해야 했다 → 많은 시간 소요, 불편함    
* SNS에는 자신의 성격이 제일 잘 나타나기 때문에 계정의 정보들만 알 수 있어도 그들의 MBTI를 파악 가능할 것이라 예상   
* 확증 편향 (질문 보고 기준 파악, 계속 같은 type이 나오도록 강화됨)   

### mbti란?
[mbti에 대한 설명](https://www.16personalities.com/ko/%EC%84%B1%EA%B2%A9-%EC%9C%A0%ED%98%95)


## 프로젝트 구성

### 프로젝트 기능
1. 인스타그램 계정마다 사진과 수량 지표를 크롤링한다.  
2. 크롤링한 지표를 .csv 형태로 저장한다.
3. 정보의 유효성을 체크하여 정보를 정리한다.
4. 정리된 정보를 사용하여 머신러닝을 진행한다.
5. swift 를 통해 ios UI/UX 를 생성한다.
6. 최종적으로 계정의 아이디를 넣으면 mbti를 예측 분석하는 시스템을 만든다. 

### 추가 기능
* 확인한 결과를 내 페이지에 저장할 수 있다.
* 결과 내용 중 나에게 잘 맞는 특성을 선택하여 내 페이지에 저장할 수 있다.
* 내 결과화면을 다른 사람에게 공유할 수 있다. 
* 모든 유형을 확인할 수 있다. 
* 나의 sns 특성을 직접 작성할 수 있다. 
* 계정 2개를 입력하여 mbti 궁합을 볼 수 있다. 
* 나와 같은 집단에 속하는 유명인의 계정을 제공한다.


## 프로젝트 구현
### 기술 설명
#### Web Crawling
* 개발환경: pycharm / google cloud vision api
* 사용 pkg: selenium / emoticon / csv
* MBTI를 해시태그에 입력하여, 해당 MBTI를 가진 사람들의 정보를 크롤링 
* <s>각 MBTI별로 20개의 sample data를 수집하여 csv 파일로 저장</s>
* 이름 검색 → 최대한 많이 data 크롤링 (최소 천개 이상)
* 각 계정 당 following, follower, post, tag_post, story_highlight, emoji_avg, img_saturation, img_intensity 크롤링(총 8개의 지표)
* [자세한 Web Crawling 기술 설명](https://docs.google.com/document/d/14NjYR88URrvhpEfJBnVMKMgAO4SARoucDLChO9Qj6pI/edit?usp=sharing) 

#### Machine Learning
* 개발환경: google colab
* 사용 pkg: numpy / pandas / matplotlib / sklearn.cluster / AgglomerativeClustering / dendrogram
  * 각 지표와 MBTI 사이의 상관관계 수집
  * 지표를 두개씩 묶어 MBTI가 라벨링된 데이터를 분류하는 perceptron linear classifier 사용
* 변경 후: '''계층적 군집화를 통한 비지도 학습'''
  * 가장 큰 집단의 퍼센트 조정을 위한 적당한 cluster 개수 설정
  * dendrogram의 linkage 선택 
  ** affinity = euclidean <br> 
  * AgglomerativeClustering의 affinity 및 linkage 선택 
    * affinity = euclidean
    * linkage = ward → cluster 내 분산이 가장 작게끔 만드는 method 
* 실제 구현 코드
  * [hiearchical clustering](https://colab.research.google.com/drive/1GvXkhSegwkobDDTYZLWL5HWKnoRoRSol?usp=sharing) 
  * [집단 수 조정(8개) 및 집단 분석](https://colab.research.google.com/drive/1lvgpDvIb54A3g9POWSEkDhC4KsGZJZ2_?usp=sharing)
* [자세한 ML 기술 설명](https://docs.google.com/document/d/1hqvhOxQ0k8vCjGbeHqJa0CkjjbDUM1KD9HcCXy28E8s/edit?usp=sharing)

#### UI/UX
* 개발환경: swift xcode 
* 사용 pkg: SwiftUI, UIKit, Lottie

* 중간 발표 기준 UX/UI  
  * 초기화면을 인스타그램 로그인 화면과 비슷하게 구성
  * 초기화면, 로딩화면, 결과화면 구현 

* 최종 발표 기준 UX/UI  
  * Home: 로그인 화면 및 가입하기 버튼 누르면 인스타그램 가입 페이지로 이동
  * 사용자 결과: 사용자 결과 화면, 사진으로 저장하기 구현, 자신에게 맞는 특성 선택 가능
  * Result: 모든 결과 유형 보기, 자신에게 맞는 특성 선택 가능
  * Bookmark: 내 성격 유형 custom으로 추가하기, 결과 화면에서 자신에게 맞는 설명만 모아서 볼 수 있음, 수정 및 삭제 가능
  * People: 계정을 공개한 사람들과 연결 및 소통 추천
  * Home, 사용자 결과, Result, Bookmark, People 구현 

* 최종 구현 데모 영상
  * [최종 데모 영상](https://drive.google.com/file/d/1r8-UpbRqQbSAl4j5t3MY6YPStUb-PCYS/view?usp=sharing) 
<br>

### 발생 이슈 사항
#### Web Crawling
* 스토리의 유무에 따라서 게시글의 div xpath가 바뀜
* 게시글과 태그된 게시글의 두가지 탭이 있는 경우와 게시글, 태그된 게시글 + 릴스, IGTV를 사용하는 사람들은 추가적으로 탭이 있어 태그된 게시글의 div xpath가 바뀜
* 게시글 내용이 없는 경우 div 선택 불가
* 비공계 계정의 경우 게시글 내용 볼 수 없음 
* 이미지 관련 이슈
  * google cloud vision api를 사용하면 사진의 여러가지 색상 return → 최대 색상 rgb값 얻어오는 것으로 변경
  * rgb값으로 return → 기준을 명도, 채도로 변경(RGB->HSI모델)
  * 계정 당 사진 수가 많으므로 명도, 채도 평균값으로 계정마다 명도 1개, 채도 1개 나오도록 변경
  * 게시글을 클릭해서 이미지를 가져올 경우 시간 소요 많음 → 게시글을 클릭하지 않고 스크롤을 내리면서 대표 사진 추출로 변경 
  * 계정마다 폴더를 생성해서 모든 사진을 저장하려고 했으나 메모리 소모가 커서 덮어쓰기로 변경
* 인스타 검색 시스템의 문제 
  * 일부 글자만 포함하는 계정도 검색됨
  * 광고 계정이 너무 많음
  * 한번에 서치되는 계정의 개수가 한정되어있음 (최대 56개)
  * 매일 검색 순서가 약간 바뀜
  * 테스트 계정마다 검색되는 내용이 다름
  * 로그인 해야만 볼 수 있음 → web crawling 중 로그인 유지 구현

#### Machine Learning
* 기존 예상 방안 대로 각 지표와 MBTI 특성 간의 상관관계를 수집하려 했으나, 적절한 결과가 나오지 않음
* 따라서 계층적 군집화를 통한 비지도 학습 방법으로 변경 → 자세한 구현 방법은 위에
* 가장 큰 집단의 퍼센트를 적절하게 선택하다보니, cluster의 개수가 많아짐
* 가장 대표적인 지표(follower)에 따라 8개의 집단으로 re-clustering
* 적절한 affinity와 linkage 설정을 어떻게 해야할 것인지 고려

#### UI/UX
* <s>화면 전환 불가능</s> → 중간 평가 이후 해결 : Navigation
* <s>하이퍼링크 걸기 불가능</s> → 중간 평가 이후 해결 : Link, URL
* <s>이미지 넣기 불가능</s> → 중간 평가 이후 해결 : Image
* python 코드 연결 방법 for back-end?
* 계정 분석 화면(ProcessView)에서 로딩 애니메이션 구현 : airbnb-lottie-ios package 사용, loading.json file
* View 간의 데이터 공유 불편함 (데이터 값 실시간 반영 안됨) → ObservedObject 대신 EnvironmentObject 선언 (SceneDelegate.swift에 미리 선언)
* Launch Screen 구현 : info.plist에 Launch Screen key 추가 
* 로컬 앨범에 사진 저장 구현 : info.plist에 NSPhotoLibraryUsageDescription key 추가하여 사용자에게 접근 권한 허락 받음
* 결과 화면 스크롤 불가 → ScrollView → ScrollView 내에서 List 사용 불가 → Text와 OnTapGesture로 변경
* 결과 화면 구성에 필요한 색 없음 → Colors.xcassets 생성하여 .colorset 색 추가, swift 파일 내에서 static let으로 선언 후 사용



## 자료
### 회의록 및 작성 문서
[크롤링 기술 정리](https://docs.google.com/document/d/14NjYR88URrvhpEfJBnVMKMgAO4SARoucDLChO9Qj6pI/edit?usp=sharing) <br>
[ML 기술 정리](https://docs.google.com/document/d/1hqvhOxQ0k8vCjGbeHqJa0CkjjbDUM1KD9HcCXy28E8s/edit?usp=sharing)  <br>
[앱 결과화면 구성](https://docs.google.com/document/d/1eK3jR0HMS5QlqoA3-hdJPzuSH3EIFA_1PIpfik765Sc/edit?usp=sharing)  <br>
[06/04 회의](https://docs.google.com/document/d/1lT6Fm-wK7jGgjPBdBsJ32CktxrKruJ48f_y1pZ5zoK8/edit?usp=sharing)  <br>
[06/07 회의](https://docs.google.com/document/d/1M9FWFFo4eyj5iywpjXiPfSnXWt24WMLau0Cf8JYbb1o/edit?usp=sharing)  <br>
[06/17 회의](https://docs.google.com/document/d/1k3n-X66Hiw5jSJVAWrKPrX1TEkwRHHQklSVQhsUllNo/edit?usp=sharing)  <br>
[06/18 회의](https://docs.google.com/document/d/1n64SROiNUvfhv5oQxs6Kzue-V26jSDfjdBR6wOezMwo/edit?usp=sharing)  <br>
[ML 추가자료](https://docs.google.com/document/d/1-aTPfvpkkO6uoEk19UcCwJCXm7sNqNl55RCJpUchejM/edit?usp=sharing) 

### GitHub
[크롤링 github](https://github.com/serajang99/Instagram_crawling)  <br>
[UX/UI github](https://github.com/yhwcs/Instagramyaho) 
