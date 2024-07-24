package src;

public class egzersiz_programi {
    public int boy;
    public double kilo;
    public int yas;
    public String cinsiyet;

    public double hedefKilo;
    public double bazalMetabolizma;

    public String zorlukSeviyesi;
    public double ortalama_kalori_yakimi;

    public String program;


    public egzersiz_programi(int boy, double kilo, int yas,String cinsiyet){
        this.boy=boy;
        this.kilo=kilo;
        this.yas=yas;
        this.cinsiyet=cinsiyet;
        this.hedefKilo=setHedefKilo(boy,cinsiyet);
        this.bazalMetabolizma=setBazalMetabolizma(boy,kilo,yas,cinsiyet);
        this.zorlukSeviyesi=setZorlukSeviyesi(boy,cinsiyet,yas);
        this.program=program(zorlukSeviyesi,cinsiyet);



    }

    public double setHedefKilo(int boy,String cinsiyet){
        double hedefKilo=0;
        if (cinsiyet.equals("erkek")) {
            hedefKilo=50+2.3*((boy/2.54)-60);
        } else if (cinsiyet.equals("kız")) {
            hedefKilo=45.5+2.3*((boy/2.54)-60);
        }

        return hedefKilo;
    }

    public String setZorlukSeviyesi (double bazalMetabolizma,String cinsiyet,int yas){
        String zorlukSeviyesi="";

        if (cinsiyet.equals("erkek")){
            if (bazalMetabolizma<1200){
                zorlukSeviyesi="zor"; this.ortalama_kalori_yakimi=1200;}
            else if (bazalMetabolizma>1200 && bazalMetabolizma<1600) {
                zorlukSeviyesi="orta"; this.ortalama_kalori_yakimi=900;
            }else{ zorlukSeviyesi="kolay"; this.ortalama_kalori_yakimi=600;}
        }

        if (cinsiyet.equals("kız")){
            if (bazalMetabolizma<1000){
                zorlukSeviyesi="zor"; this.ortalama_kalori_yakimi=100;  }
            else if (bazalMetabolizma>1000 && bazalMetabolizma<1400) {
                zorlukSeviyesi="orta"; this.ortalama_kalori_yakimi=700;
            }else{ zorlukSeviyesi="kolay"; this.ortalama_kalori_yakimi=450; }
        }

        if (yas>=60) {
            zorlukSeviyesi="kolay";
        }
        
        return zorlukSeviyesi;
    }

    public double setBazalMetabolizma(int boy, double kilo,int yas,String cinsiyet){
        double bazal=0;

        if (cinsiyet.equals("erkek")) {
            bazal=660.47+(13.75*kilo)+((double)5*boy/100)-(6.76*yas);
        } else if (cinsiyet.equals("kız")) {
            bazal=655.10+(9.56*kilo)+(1.85*boy/100)-(4.68*yas);
        }

        return bazal;
    }

    public String program(String zorlukSeviyesi,String cinsiyet){
        String program="";
        
            if (cinsiyet.equals("erkek")){
                if (zorlukSeviyesi.equals("zor")) {
                    program=" 4x12 barbell bench press " +
                        " 4x12 wide grip latt pulldown " +
                        " 4x12 chest supported dumbell row" +
                        " 3x15 standing dumbell curl " +
                        " 3x15 bench dips " +
                        " 20 dakika 10km/h hızda koşu " + 
                        " 10 dakika eliptik bisiklet "; 
                } else if (zorlukSeviyesi.equals("orta")) {
                    program=" 4x12 barbell bench press " +
                            " 4x12 wide grip latt pulldown " +
                            " 4x12 squat" +
                            " 15 dakika 7km/h hızda koşu " +
                            " 10 dakika eliptik bisiklet ";
                } else if (zorlukSeviyesi.equals("kolay")) {
                    program=" 30 dakika 5km/h hızda yürüyüş " +
                            " 15 dakika eliptik bisiklet ";}
            } else if (cinsiyet.equals("kız")) {
                if (zorlukSeviyesi.equals("zor")) {
                    program=" 4x12 dumbell raise " +
                            " 4x12 thigh adductor " +
                            " 3x15 barbell hip thrust" +
                            " 3x15 glute kickback " +
                            " 4x12 squat" +
                            " 3x15 seated cable rows " +
                            " 15 dakika 10km/h hızda koşu " +
                            " 10 dakika recumbent bisiklet ";
                } else if (zorlukSeviyesi.equals("orta")) {
                    program=" 4x12 thigh adductor " +
                            " 3x15 barbell hip thrust" +
                            " 4x12 squat" +
                            " 15 dakika 7km/h hızda koşu " +
                            " 10 dakika recumbent bisiklet ";
                } else if (zorlukSeviyesi.equals("kolay")) {
                    program=" 30 dakika 5km/h hızda yürüyüş " +
                            " 15 dakika eliptik bisiklet ";}

            }

        return program;
    }







}
