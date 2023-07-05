package effectiveJava.ch08.item_046;

public class Card {
    String suit;
    String rank;
    public Card(String suit, String rank) {
        super();
        this.suit = suit;
        this.rank = rank;
    }
    public String getSuit() {
        return suit;
    }
    public void setSuit(String suit) {
        this.suit = suit;
    }
    public String getRank() {
        return rank;
    }
    public void setRank(String rank) {
        this.rank = rank;
    }
}
