package effectiveJava.item_046;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;


/**
 * forEachLoop demo
 * @see Effective Java item:46
 *
 */
public class ForEachLoop {

    enum Suit { CLUB, DIAMOND, HEART, SPADE }
    enum Rank { ACE, DEUCE, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT, NINE, TEN, JACK, QUEEN, KING }

    public static void main (String[] args) {
        Collection<Suit> suits = Arrays.asList(Suit.values());
        Collection<Rank> ranks = Arrays.asList(Rank.values());

        List<Card> deck = new ArrayList<Card>();
//        for (Iterator<Suit> i = suits.iterator(); i.hasNext();) {
//            Suit suit = i.next();
//            for (Iterator<Rank> j = ranks.iterator(); j.hasNext();) {
//                deck.add(new Card(suit.toString(), j.next().toString()));
//            }
//        }

        for (Suit suit: suits) {
            for (Rank rank: ranks) {
                deck.add(new Card(suit.toString(), rank.toString()));
            }
        }
        for (Card card: deck) {
            System.out.println("----------");
            System.out.println(card.getSuit());
            System.out.println(card.getRank());
        }
    }
}
