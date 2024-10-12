package neronsoda;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt(), m = sc.nextInt();
        int[] trees = new int[n];
        for (int i = 0; i < n; i++) {
            trees[i] = sc.nextInt();
        }
        Arrays.sort(trees);

        int left = 0, right = trees[trees.length - 1];
        int answer = 0;

        while (left <= right) {
            int mid = (left + right) / 2;
            long total = 0;
            for (int i = 0; i < n; i++) {
                if (trees[i] <= mid) continue;
                total += (trees[i] - mid);
            }
            if (total >= m) {
                left = mid + 1;
                answer = Math.max(answer, mid);
            } else {
                right = mid - 1;
            }
        }
        System.out.println(answer);
    }

}
