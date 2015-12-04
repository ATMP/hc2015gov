import jieba
import jieba.analyse
import json
import sys
import codecs

def bot(query, readfile):
    def cal_score(words,dic):
        score = 0
        score += sum([ 10 * dic['keyword'].count(w)  for w in words])
        score += sum([  5 * dic['question'].count(w) for w in words])
        score += sum([  1 * dic['answer'].count(w)   for w in words])
        return score    

    max_score = 0
    max_question = ''
    max_answer = ''    
    datas = json.load(open(readfile))
    words = list(jieba.cut_for_search(query.replace(' ','')))
    for data in datas:
        score = cal_score(words,data)
        if score > max_score:
            max_score = score
            max_question = ''.join(data['question'])
            max_answer = ''.join(data['answer'])

    print ('Q:\n'+max_question+'\nA:\n'+max_answer).encode('utf-8')
    # f = codecs.open(writefile,'w','utf8')
    # f.write('Q:\n'+max_question+'\nA:\n'+max_answer)
    # f.close()
    
bot(sys.argv[1],sys.argv[2])
    