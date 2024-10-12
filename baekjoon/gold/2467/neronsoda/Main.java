package neronsoda;

import java.util.*;

public class Main {

    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = sc.nextInt();
        int[] arr = new int[n];
        for (int i = 0; i < n; i++) {
            arr[i] = sc.nextInt();
        }

        int start = 0, end = arr.length - 1;
        int first = 0, second = 0;
        int ans = Integer.MAX_VALUE;

        while (start < end) {
            int sum = arr[start] + arr[end];
            int absSum = Math.abs(sum);

            if (absSum <= ans) {
                ans = absSum;
                first = arr[start];
                second = arr[end];
            }

            if (sum > 0) end--;
            else start++;

        }
        System.out.println(first + " " + second);
    }

}
