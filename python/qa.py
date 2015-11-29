import jieba
import jieba.analyse
import json

def bot(query, file_name):
    def cal_score(words,dic):
        score = 0
        score += sum([ 10 * dic['keyword'].count(w)  for w in words])
        score += sum([  5 * dic['question'].count(w) for w in words])
        score += sum([  1 * dic['answer'].count(w)   for w in words])
        return score    

    max_score = 0
    max_question = ''
    max_answer = ''    
    datas = json.load(open(file_name))
    words = list(jieba.cut_for_search(query.replace(' ','')))
    for data in datas:
        score = cal_score(words,data)
        if score > max_score:
            max_score = score
            max_question = ''.join(data['question'])
            max_answer = ''.join(data['answer'])

    return max_question, max_answer