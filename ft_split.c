/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_split.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: alijenabi <alijenabi@student.42.fr>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/26 12:58:36 by alijenabi         #+#    #+#             */
/*   Updated: 2022/05/05 15:29:38 by alijenabi        ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdlib.h>

/**
 * Gets the length of the next word from 's' seperated by 'c'
 * @param s[in, out]    The adress of string to be split.
 * @param c[in]         The delimiter character.
 * @return The word length.
 * @note Moves the 's' pointer to the beginning of the word.
 */
static size_t	st_next_word_len(char const **s, char c)
{
	size_t	len;

	len = 0;
	while (**s == c)
		(*s)++;
	while ((*s)[len] && (*s)[len] != c)
	{
		len++;
	}
	return (len);
}

/**
 * Counts the number of words in side the string ('s').
 * @param[in] s	The adress of string to be split.
 * @param[in] c	The delimiter character.
 * @return The number of words in string 's'.
 */
static size_t	st_word_count(char const *s, char c)
{
	int	count;

	if (!*s)
		return (0);
	count = 0;
	while (*s)
	{
		if (*s != c)
			count++;
		while (*s && *s != c)
			s++;
		if (*s)
			s++;
	}
	return (count);
}

/** 
 * Allocates (with malloc(3)) and returns an array of strings obtained by 
 * splitting ’s’ using the character ’c’ as a delimiter. The array must end 
 * with a NULL pointer.
 * @param[in] s  The string to be split.
 * @param[in] c  The delimiter character.
 * @return The array of new strings resulting from the split. NULL if the 
 * 			allocation fails.
 */
char	**ft_split(char const *s, char c)
{
	const char	**ans;
	char		**ans_itr;
	char		*current;
	size_t		split_count;

	if (!s)
		return (NULL);
	split_count = st_word_count(s, c);
	ans = (const char **)malloc((split_count + 1) * sizeof(char *));
	if (!ans)
		return (0);
	ans_itr = (char **)ans;
	current = 0;
	while (split_count)
	{
		current = (char *)malloc((st_next_word_len(&s, c) + 1) * sizeof(char));
		if (!current)
			return (0);
		*ans_itr = (char *)current;
		while (*s && *s != c)
			*current++ = *s++;
		*current = '\0';
		ans_itr++;
		split_count--;
	}
	*ans_itr = 0;
	return ((char **)ans);
}
